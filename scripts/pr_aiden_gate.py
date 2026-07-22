#!/usr/bin/env python3
"""PR-head Aiden governance gate (human-first commit loop).

Users push freely on a PR. For each PR head SHA this script:

  1. Posts commit status `aiden/governance` = pending
  2. (reporter) fires the PR governance webhook so an Aiden session is watchable
  3. (brain) calls `mcp-tf-governance.validate_tf_governance` directly
     (plan → Trivy + Rego under the hood; no tf_dir → scan changed dirs vs base)
  4. Resolves durable watch URL `session:{session_id}`
  5. Re-posts commit status with real state + Details → watch
     success=PASS · failure=FAIL · error=ERROR/transport

Exit 0 only on PASS (fail-closed). Matches deploy-gate architecture in aiden_gate.py.
"""
from __future__ import annotations

import json
import os
import sys
import time
import urllib.error
import urllib.request

try:
    from resolve_aiden_watch import resolve_execution, watch_url as _guild_watch_url
except ImportError:
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    from resolve_aiden_watch import resolve_execution, watch_url as _guild_watch_url

# Reuse MCP client from deploy gate.
try:
    import aiden_gate as _ag
except ImportError:
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    import aiden_gate as _ag


def env(*names: str, default: str = "") -> str:
    for n in names:
        v = os.environ.get(n)
        if v:
            return v
    return default


GUILD_TOKEN = env("AIDEN_GUILD_TOKEN")
WEBHOOK_URL = env("AIDEN_PR_GOVERNANCE_WEBHOOK_URL")
MCP_TOKEN = env("AIDEN_TF_GOV_MCP_TOKEN")

PROJECT = env("GATE_PROJECT")
REF = env("GATE_REF")  # PR head branch (or SHA) for clone
BASE_REF = env("GATE_BASE_REF", default="main")
COMMIT_SHA = env("GATE_COMMIT_SHA")
PR_NUMBER = env("GATE_PR_NUMBER")
PR_URL = env("GATE_PR_URL")
SOURCE_BRANCH = env("GATE_SOURCE_BRANCH")
TARGET_BRANCH = env("GATE_TARGET_BRANCH")
RUN_URL = env("GATE_RUN_URL")
CHANGED_FILES_RAW = env("GATE_CHANGED_FILES", default="[]")
GH_TOKEN = env("GH_TOKEN", "GITHUB_TOKEN")
REPO = env("GATE_REPO", default=PROJECT)

WATCH_RESOLVE_TIMEOUT = int(env("AIDEN_WATCH_RESOLVE_TIMEOUT", default="90"))
STATUS_CONTEXT = "aiden/governance"


def summary(md: str) -> None:
    print(md)
    path = os.environ.get("GITHUB_STEP_SUMMARY")
    if path:
        try:
            with open(path, "a") as f:
                f.write(md + "\n")
        except Exception:  # noqa: BLE001
            pass


def _changed_files() -> list:
    try:
        data = json.loads(CHANGED_FILES_RAW or "[]")
        return data if isinstance(data, list) else []
    except Exception:  # noqa: BLE001
        return []


def post_commit_status(
    state: str,
    description: str,
    target_url: str = "",
) -> None:
    """POST repos/{repo}/statuses/{sha}. Soft-fail if token/sha missing."""
    if not GH_TOKEN or not REPO or not COMMIT_SHA:
        summary(f"- commit status skipped (missing token/repo/sha) · wanted `{state}`")
        return
    body: dict = {
        "state": state,  # pending | success | failure | error
        "context": STATUS_CONTEXT,
        "description": (description or "")[:140],
    }
    if target_url:
        body["target_url"] = target_url
    data = json.dumps(body).encode()
    url = f"https://api.github.com/repos/{REPO}/statuses/{COMMIT_SHA}"
    req = urllib.request.Request(
        url,
        data=data,
        method="POST",
        headers={
            "Authorization": f"Bearer {GH_TOKEN}",
            "Accept": "application/vnd.github+json",
            "Content-Type": "application/json",
            "X-GitHub-Api-Version": "2022-11-28",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            summary(f"- commit status `{STATUS_CONTEXT}` → `{state}` (HTTP {resp.status})")
    except urllib.error.HTTPError as e:
        err = e.read().decode()[:300]
        summary(f"- commit status HTTP {e.code}: {err}")
    except Exception as e:  # noqa: BLE001
        summary(f"- commit status error: `{e}`")


def fire_pr_webhook() -> tuple[str, str]:
    """Fire PR governance webhook; return (trace_id, session_id)."""
    if not WEBHOOK_URL:
        summary("- Aiden reporter: `AIDEN_PR_GOVERNANCE_WEBHOOK_URL` unset — no watch run.")
        return "", ""
    payload = {
        "source": "github-actions",
        "event": "pr_governance_scan",
        "kind": "terraform",
        "project": PROJECT,
        "pr_number": PR_NUMBER,
        "pr_url": PR_URL,
        "source_branch": SOURCE_BRANCH or REF,
        "target_branch": TARGET_BRANCH or BASE_REF,
        "commit_sha": COMMIT_SHA,
        "run_url": RUN_URL,
        "changed_files": _changed_files(),
        "instruction": (
            "Terraform PR — run mcp-tf-governance.validate_tf_governance on this "
            "commit/branch (plan-based), report PASS/FAIL or plan-failure, never apply. "
            "CI also calls the same tool for the authoritative merge check."
        ),
    }
    data = json.dumps(payload).encode()
    req = urllib.request.Request(
        WEBHOOK_URL,
        data=data,
        method="POST",
        headers={"Content-Type": "application/json"},
    )
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            code, body = resp.status, resp.read().decode()
    except urllib.error.HTTPError as e:
        code, body = e.code, e.read().decode()
    except Exception as e:  # noqa: BLE001
        summary(f"- Aiden reporter: webhook error (non-fatal): `{e}`")
        return "", ""

    summary(f"- Aiden reporter: webhook HTTP `{code}`")
    try:
        json.loads(body or "{}")
    except Exception:  # noqa: BLE001
        pass

    if not RUN_URL or not GUILD_TOKEN:
        if not GUILD_TOKEN:
            summary("- Aiden reporter: `AIDEN_GUILD_TOKEN` unset — cannot resolve session watch URL")
        return "", ""

    summary("- Resolving Aiden watch URL (correlate on run_url)...")
    ex = resolve_execution(RUN_URL, timeout_s=WATCH_RESOLVE_TIMEOUT)
    return ex.get("trace_id") or "", ex.get("session_id") or ""


def _status_for_verdict(verdict: str) -> tuple[str, str]:
    v = (verdict or "ERROR").upper()
    if v == "PASS":
        return "success", "Governance PASS — open Aiden scan"
    if v == "FAIL":
        return "failure", "Governance FAIL — open Aiden scan"
    return "error", f"Governance {v} — open Aiden scan"


def main() -> int:
    if not PROJECT or not REF:
        summary("**PR governance ERROR** — GATE_PROJECT / GATE_REF not set.")
        post_commit_status("error", "Governance ERROR — misconfigured gate")
        return 1
    if not MCP_TOKEN:
        summary("**PR governance ERROR** — `AIDEN_TF_GOV_MCP_TOKEN` secret not set.")
        post_commit_status("error", "Governance ERROR — MCP token missing")
        return 1
    if not COMMIT_SHA:
        summary("**PR governance ERROR** — GATE_COMMIT_SHA not set.")
        return 1

    summary("## Aiden PR governance")
    summary(
        f"- Project: `{PROJECT}` · ref: `{REF}` · base: `{BASE_REF}` · "
        f"sha: `{COMMIT_SHA[:7]}`"
    )

    post_commit_status("pending", "Aiden governance scan running (plan + policies)…")

    # Reporter first so humans can open the watch while the MCP plan runs.
    trace_id, session_id = fire_pr_webhook()
    link = _guild_watch_url(session_id=session_id, trace_id=trace_id)
    if link:
        summary(f"- Aiden watch: {link}")
        # Keep Details clickable while still pending.
        post_commit_status(
            "pending",
            "Aiden governance scan running — open to watch",
            target_url=link,
        )
    else:
        summary("- Aiden watch: not resolved yet (verdict still authoritative from MCP)")

    summary("- Verdict source: Aiden `mcp-tf-governance.validate_tf_governance` (plan-based).")
    t0 = time.time()
    try:
        verdict = _ag.call_validate(
            project=PROJECT,
            ref=REF,
            base_ref=BASE_REF,
            tf_dir="",  # pre-PR / PR mode: changed dirs vs base
        )
    except Exception as e:  # noqa: BLE001
        summary(f"\n**Result: ERROR (fail-closed)** — `{e}`")
        post_commit_status(
            "error",
            "Governance ERROR — scan unreachable",
            target_url=link,
        )
        return 1
    dt = int(time.time() - t0)

    v = (verdict.get("verdict") or "ERROR").upper()
    gates = verdict.get("gates", {}) or {}
    gate_line = " · ".join(f"{k}={val}" for k, val in gates.items()) if gates else "n/a"
    scanned = verdict.get("scanned_dirs") or []
    findings = (verdict.get("findings") or "").strip()
    plan_error = (verdict.get("plan_error") or "").strip()

    summary(f"- Gates: `{gate_line}` · scanned: `{scanned}` · {dt}s")
    state, desc = _status_for_verdict(v)
    post_commit_status(state, desc, target_url=link)

    if v == "PASS":
        summary("\n**Result: PASS** — PR head cleared plan-based governance.")
        if link:
            summary(f"- [Open Aiden governance execution]({link})")
        return 0

    summary(f"\n**Result: {v}** — merge should stay blocked until fixed.")
    if plan_error:
        summary(
            "\n<details><summary>terraform plan error</summary>\n\n```\n"
            + plan_error[:3000]
            + "\n```\n</details>"
        )
    if findings:
        summary(
            "\n<details><summary>findings</summary>\n\n```\n"
            + findings[:4000]
            + "\n```\n</details>"
        )
    if link:
        summary(f"- [Open Aiden governance execution]({link})")
    return 1


if __name__ == "__main__":
    sys.exit(main())
