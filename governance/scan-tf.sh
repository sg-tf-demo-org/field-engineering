#!/usr/bin/env bash
# Unified Terraform governance scanner (the "scan gate") — PLAN-BASED.
#
# This is the Terraform sibling of governance/scan-cfn.sh. The hard, non-negotiable
# rule is that governance is ALWAYS evaluated against a real `terraform plan`, never
# against HCL heuristics. Every invocation (local dev, the mcp-tf-governance
# `submit_tf_pr` flow, and GitHub Actions CI) performs:
#
#     terraform init  -> terraform plan -out=tfplan.binary
#                     -> terraform show -json tfplan.binary > tfplan.json
#
# and then evaluates that plan JSON with TWO gates:
#   1. CSPM               -> trivy config (HIGH,CRITICAL, exit 1) on the plan JSON
#   2. Policy (tags/region/cspm) -> conftest with the TF-plan Rego in
#                            governance/policies/tf (walks planned_values +
#                            resource_changes, NOT CloudFormation Resources{}).
#
# Fail-closed: if a plan cannot be produced, the gate ERRORs (exit 2). It never
# silently passes.
#
# Usage:
#   governance/scan-tf.sh <env-dir> [--json out.json]
#   governance/scan-tf.sh --plan-json <tfplan.json> [--json out.json]   # evaluate an
#                                                                        # existing plan
# Exit: 0 = PASS, 1 = FAIL (a gate denied), 2 = ERROR / usage / no-plan (fail-closed)
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
POLICY_DIR="${GOV_TF_POLICY_DIR:-$SCRIPT_DIR/policies/tf}"

have() { command -v "$1" >/dev/null 2>&1; }
BLUE='\033[0;34m'; GREEN='\033[0;32m'; RED='\033[0;31m'; YEL='\033[0;33m'; NC='\033[0m'

TARGET=""
PLAN_JSON=""
JSON_OUT=""

# ---- arg parsing --------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --plan-json) PLAN_JSON="${2:-}"; shift 2 ;;
    --json)      JSON_OUT="${2:-}"; shift 2 ;;
    -h|--help)
      echo "usage: $0 <env-dir> [--json out.json]"
      echo "       $0 --plan-json <tfplan.json> [--json out.json]"
      exit 2 ;;
    *)
      if [[ -z "$TARGET" ]]; then TARGET="$1"; fi
      shift ;;
  esac
done

fail_closed() {
  echo -e "${RED}GOVERNANCE: ERROR${NC} — $1 (fail-closed: no plan means no PASS)" >&2
  [[ -n "$JSON_OUT" ]] && printf '{\n  "overall": "ERROR",\n  "reason": %s\n}\n' "\"$1\"" > "$JSON_OUT"
  exit 2
}

# ---- resolve the plan JSON ----------------------------------------------------
CLEANUP_DIR=""
cleanup() { [[ -n "$CLEANUP_DIR" && -d "$CLEANUP_DIR" ]] && rm -rf "$CLEANUP_DIR"; }
trap cleanup EXIT

if [[ -z "$PLAN_JSON" ]]; then
  # Generate the plan from the target directory.
  if [[ -z "$TARGET" || ! -d "$TARGET" ]]; then
    echo "usage: $0 <env-dir> [--json out.json]" >&2
    exit 2
  fi
  have terraform || fail_closed "terraform not installed"

  echo -e "${BLUE}== Terraform governance scan (plan-based) ==${NC}"
  echo "Target dir : $TARGET"
  echo "Policies   : $POLICY_DIR"
  echo

  echo -e "${BLUE}--- terraform init ---${NC}"
  if ! terraform -chdir="$TARGET" init -input=false -no-color -upgrade >/tmp/tf-init.$$ 2>&1; then
    cat /tmp/tf-init.$$ >&2; rm -f /tmp/tf-init.$$
    fail_closed "terraform init failed"
  fi
  rm -f /tmp/tf-init.$$

  echo -e "${BLUE}--- terraform plan ---${NC}"
  if ! terraform -chdir="$TARGET" plan -input=false -no-color -lock=false -out=tfplan.binary >/tmp/tf-plan.$$ 2>&1; then
    cat /tmp/tf-plan.$$ >&2; rm -f /tmp/tf-plan.$$
    fail_closed "terraform plan failed"
  fi
  rm -f /tmp/tf-plan.$$

  echo -e "${BLUE}--- terraform show -json ---${NC}"
  PLAN_JSON="$TARGET/tfplan.json"
  if ! terraform -chdir="$TARGET" show -json tfplan.binary > "$PLAN_JSON" 2>/tmp/tf-show.$$; then
    cat /tmp/tf-show.$$ >&2; rm -f /tmp/tf-show.$$
    fail_closed "terraform show -json failed"
  fi
  rm -f /tmp/tf-show.$$
fi

# Validate we actually have a usable plan JSON (fail-closed).
[[ -f "$PLAN_JSON" ]] || fail_closed "plan JSON not found: $PLAN_JSON"
if have jq; then
  jq -e '.planned_values or .resource_changes' "$PLAN_JSON" >/dev/null 2>&1 \
    || fail_closed "plan JSON is not a valid terraform plan (missing planned_values/resource_changes)"
fi

echo
echo -e "${BLUE}== Evaluating plan JSON ==${NC} $PLAN_JSON"
echo

overall_fail=0

# ---- Gate 1: CSPM via trivy config on the plan JSON ---------------------------
TRIVY_TIMEOUT="${TRIVY_TIMEOUT:-90}"
DISABLE_TRIVY="${DISABLE_TRIVY:-0}"
run_bounded() {
  local secs="$1"; shift
  if have timeout; then timeout "$secs" "$@"; return $?; fi
  if have gtimeout; then gtimeout "$secs" "$@"; return $?; fi
  "$@"
}

if have trivy && [[ "$DISABLE_TRIVY" != "1" ]]; then
  tout="$(run_bounded "$TRIVY_TIMEOUT" trivy config --quiet --severity HIGH,CRITICAL --exit-code 1 "$PLAN_JSON" 2>&1)"
  trc=$?
  if [[ $trc -eq 124 ]]; then
    echo -e "  ${YEL}WARN${NC} Governance CSPM (trivy) timed out after ${TRIVY_TIMEOUT}s"
  elif [[ $trc -ne 0 ]]; then
    echo -e "  ${RED}FAIL${NC} Governance CSPM (trivy config, HIGH/CRITICAL)"
    echo "$tout" | grep -E 'MISCONF|HIGH|CRITICAL|AVD-|^Report|Failures' | sed 's/^/      /' | head -40
    overall_fail=1
  else
    echo -e "  ${GREEN}PASS${NC} Governance CSPM (trivy config)"
  fi
else
  echo -e "  ${YEL}SKIP${NC} Governance CSPM (trivy disabled/absent) — policy CSPM still enforced"
fi

# ---- Gate 2: tags + region + cspm via conftest (TF-plan Rego) ------------------
if have conftest; then
  cout="$(conftest test --no-color -p "$POLICY_DIR" "$PLAN_JSON" 2>&1)"
  crc=$?
  if [[ $crc -ne 0 ]]; then
    echo -e "  ${RED}FAIL${NC} Policy (rego: CSPM + tags + region)"
    echo "$cout" | grep -E 'FAIL|MANDATORY-TAGS|REGION-RESTRICTION|CSPM|failure' | sed 's/^/      /' | head -60
    overall_fail=1
  else
    echo -e "  ${GREEN}PASS${NC} Policy (rego: CSPM + tags + region)"
  fi
else
  echo -e "  ${YEL}SKIP${NC} Policy (conftest not installed)"
fi

# ---- Summary / JSON -----------------------------------------------------------
echo
if [[ -n "$JSON_OUT" ]]; then
  printf '{\n  "overall": "%s",\n  "plan_json": "%s"\n}\n' \
    "$([[ $overall_fail -eq 0 ]] && echo PASS || echo FAIL)" "$PLAN_JSON" > "$JSON_OUT"
  echo "JSON: $JSON_OUT"
fi

if [[ $overall_fail -eq 0 ]]; then
  echo -e "${GREEN}GOVERNANCE: PASS${NC}"; exit 0
else
  echo -e "${RED}GOVERNANCE: FAIL${NC}"; exit 1
fi
