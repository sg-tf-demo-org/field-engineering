#!/usr/bin/env python3
"""Aiden-driven governance gate for the progressive deploy pipeline.

This is the CI side of Model A: the pipeline "only talks to Aiden". It does NOT
run terraform, trivy, conftest, or assume any AWS role. Instead it:

  1. (reporter) fires the Aiden "deploy governance gate" webhook so an Aiden
     agent execution is created — the job prints the deep "watch" URL so a human
     can watch Aiden govern the change live; and
  2. (brain / verdict) calls Aiden's governance MCP tool
     `mcp-tf-governance.validate_tf_governance(project, ref, tf_dir=...)` directly
     over streamable-HTTP. That tool clones the repo and runs
     `terraform plan -> trivy + conftest/Rego` UNDER THE HOOD in-cluster and
     returns a deterministic JSON verdict (PASS / FAIL / ERROR). Trivy/terraform
     are never visible or run here.

Why call the MCP directly for the verdict instead of polling the webhook run?
The Guild executions API only exposes `status` + an (empty) `structured_output`;
it does not return the agent's final message or nodes, so a webhook poll can
never yield a reliable verdict. The MCP tool call is synchronous and
deterministic, so the gate is a hard, fail-closed green/red — exactly the
"no deploy unless governance passes" guarantee. The webhook run is the
human-facing reporter (the watch URL).

Exit code: 0 on PASS, 1 on FAIL / ERROR / timeout / transport error (fail-closed).
"""
from __future__ import annotations

import json
import os
import sys
import time
import urllib.error
import urllib.request


def env(*names: str, default: str = "") -> str:
    for n in names:
        v = os.environ.get(n)
        if v:
            return v
    return default


GUILD_BASE = env("AIDEN_GUILD_BASE", default="https://stage.dev.stackgen.com").rstrip("/")
ORG_ID = env("AIDEN_ORG_ID", default="aee77bee-6885-4b4b-b9c0-e0c7ae81be96")
GUILD_TOKEN = env("AIDEN_GUILD_TOKEN")  # optional; used to fetch execution status
MCP_URL = env("AIDEN_TF_GOV_MCP_URL", default="https://mcp-tf-governance.stackgen.run/mcp")
MCP_TOKEN = env("AIDEN_TF_GOV_MCP_TOKEN")
WEBHOOK_URL = env("AIDEN_DEPLOY_GATE_WEBHOOK_URL")

PROJECT = env("GATE_PROJECT")            # e.g. sg-tf-demo-org/field-engineering
REF = env("GATE_REF", default="main")
TF_DIR = env("GATE_TF_DIR")              # e.g. environments/dev
ENVIRONMENT = env("GATE_ENVIRONMENT", default="dev")
RUN_URL = env("GATE_RUN_URL")

MCP_TIMEOUT = int(env("GATE_MCP_TIMEOUT", default="600"))  # tool call read timeout
EXEC_POLL_INTERVAL = int(env("GATE_EXEC_POLL_INTERVAL", default="10"))
EXEC_POLL_TIMEOUT = int(env("GATE_EXEC_POLL_TIMEOUT", default="120"))


def summary(md: str) -> None:
    print(md)
    path = os.environ.get("GITHUB_STEP_SUMMARY")
    if path:
        try:
            with open(path, "a") as f:
                f.write(md + "\n")
        except Exception:  # noqa: BLE001
            pass


def watch_url(run_id: str) -> str:
    rid = (run_id or "").replace("-", "")
    return f"{GUILD_BASE}/app/settings/workspace/devops-copilot/executions/{rid}/watch"


# --------------------------------------------------------------------------- #
# 1) Reporter: fire the Aiden webhook (best-effort) to create a watchable run.
# --------------------------------------------------------------------------- #
def fire_webhook() -> str:
    if not WEBHOOK_URL:
        summary("- Aiden reporter: `AIDEN_DEPLOY_GATE_WEBHOOK_URL` unset — skipping watch run.")
        return ""
    payload = {
        "source": "github-actions",
        "event": "deploy_governance_gate",
        "kind": "terraform",
        "project": PROJECT,
        "ref": REF,
        "environment": ENVIRONMENT,
        "tf_dir": TF_DIR,
        "run_url": RUN_URL,
        "instruction": (
            f"Progressive deploy gate for `{ENVIRONMENT}`. Run "
            f"mcp-tf-governance.validate_tf_governance(project='{PROJECT}', ref='{REF}', "
            f"tf_dir='{TF_DIR}') and report PASS/FAIL/plan-failure. "
            "Report-only: never deploy or apply."
        ),
    }
    data = json.dumps(payload).encode()
    req = urllib.request.Request(
        WEBHOOK_URL, data=data, method="POST",
        headers={"Content-Type": "application/json"},
    )
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            body = resp.read().decode()
            code = resp.status
    except urllib.error.HTTPError as e:  # noqa
        code, body = e.code, e.read().decode()
    except Exception as e:  # noqa: BLE001
        summary(f"- Aiden reporter: webhook error (non-fatal): `{e}`")
        return ""
    run_id = ""
    try:
        run_id = (json.loads(body) or {}).get("run_id", "") or ""
    except Exception:  # noqa: BLE001
        pass
    if run_id:
        summary(f"- Aiden reporter run: [`{run_id}`]({watch_url(run_id)}) "
                f"(watch Aiden govern `{ENVIRONMENT}` live) · webhook HTTP `{code}`")
    else:
        summary(f"- Aiden reporter: webhook HTTP `{code}` (no run_id returned)")
    return run_id


def fetch_execution_status(run_id: str) -> str:
    """GET /guild/api/v1/executions/{run_id} and return status (best-effort).

    The Guild API exposes status (completed/failed/...) but NOT findings/verdict
    (structured_output is empty). We still fetch + print status so the job shows
    the execution was retrieved; the authoritative PASS/FAIL comes from the MCP.
    """
    if not run_id:
        return ""
    # Prefer a Guild token when present; fall back to unauthenticated GET (may 401).
    headers = {"Accept": "application/json"}
    if GUILD_TOKEN:
        headers["Authorization"] = f"Bearer {GUILD_TOKEN}"
        headers["x-org-id"] = ORG_ID
    url = f"{GUILD_BASE}/guild/api/v1/executions/{run_id}?orgId={ORG_ID}"
    deadline = time.time() + EXEC_POLL_TIMEOUT
    last_status = ""
    while time.time() < deadline:
        try:
            req = urllib.request.Request(url, headers=headers, method="GET")
            with urllib.request.urlopen(req, timeout=15) as resp:
                body = json.loads(resp.read().decode() or "{}")
            ex = body.get("execution") or body
            last_status = (ex.get("status") or body.get("status") or "").lower()
            if last_status in ("completed", "failed", "error", "succeeded", "finished"):
                break
        except Exception as e:  # noqa: BLE001
            summary(f"- Aiden execution fetch: `{e}` (non-fatal; continuing)")
            return last_status
        time.sleep(EXEC_POLL_INTERVAL)
    if last_status:
        summary(f"- Aiden execution status (fetched): `{last_status}` · "
                f"[watch]({watch_url(run_id)})")
    else:
        summary(f"- Aiden execution status: not available · [watch]({watch_url(run_id)})")
    return last_status


# --------------------------------------------------------------------------- #
# 2) Brain: call the governance MCP tool directly for a deterministic verdict.
# --------------------------------------------------------------------------- #
_MCP_HEADERS = {
    "Content-Type": "application/json",
    "Accept": "application/json, text/event-stream",
}


def _mcp_post(body: dict, session_id: str = "") -> tuple[int, dict, str]:
    headers = dict(_MCP_HEADERS)
    if MCP_TOKEN:
        headers["Authorization"] = f"Bearer {MCP_TOKEN}"
    if session_id:
        headers["mcp-session-id"] = session_id
    req = urllib.request.Request(
        MCP_URL, data=json.dumps(body).encode(), method="POST", headers=headers,
    )
    with urllib.request.urlopen(req, timeout=MCP_TIMEOUT) as resp:
        raw = resp.read().decode()
        sid = resp.headers.get("mcp-session-id", "")
        return resp.status, _parse_sse(raw), sid


def _parse_sse(raw: str) -> dict:
    """Return the last JSON object from an SSE (or plain-JSON) MCP response."""
    last: dict = {}
    for line in raw.splitlines():
        line = line.strip()
        if line.startswith("data:"):
            line = line[len("data:"):].strip()
        if not line or not line.startswith("{"):
            continue
        try:
            last = json.loads(line)
        except Exception:  # noqa: BLE001
            continue
    return last


def call_validate() -> dict:
    """Full streamable-HTTP handshake + tools/call. Returns the verdict dict."""
    init = {
        "jsonrpc": "2.0", "id": 1, "method": "initialize",
        "params": {
            "protocolVersion": "2024-11-05",
            "capabilities": {},
            "clientInfo": {"name": "aiden-gate", "version": "1.0"},
        },
    }
    _code, _resp, sid = _mcp_post(init)
    if not sid:
        raise RuntimeError("MCP initialize returned no mcp-session-id")

    # notifications/initialized (no response body expected)
    try:
        _mcp_post({"jsonrpc": "2.0", "method": "notifications/initialized"}, sid)
    except Exception:  # noqa: BLE001
        pass

    call = {
        "jsonrpc": "2.0", "id": 2, "method": "tools/call",
        "params": {
            "name": "validate_tf_governance",
            "arguments": {"project": PROJECT, "ref": REF, "tf_dir": TF_DIR},
        },
    }
    _code, resp, _sid = _mcp_post(call, sid)
    if "error" in resp:
        raise RuntimeError(f"MCP tool error: {resp['error']}")
    result = resp.get("result", {})
    content = result.get("content", [])
    text = ""
    for c in content:
        if c.get("type") == "text":
            text = c.get("text", "")
            break
    if not text:
        # Some servers return structuredContent directly.
        sc = result.get("structuredContent")
        if isinstance(sc, dict):
            return sc
        raise RuntimeError(f"MCP tool returned no text content: {json.dumps(result)[:500]}")
    return json.loads(text)


def main() -> int:
    if not PROJECT or not TF_DIR:
        summary("**Governance gate ERROR** — GATE_PROJECT / GATE_TF_DIR not set.")
        return 1
    if not MCP_TOKEN:
        summary("**Governance gate ERROR** — `AIDEN_TF_GOV_MCP_TOKEN` secret not set.")
        return 1

    summary(f"## Governance - {ENVIRONMENT} (Aiden)")
    summary(f"- Project: `{PROJECT}` · ref: `{REF}` · dir: `{TF_DIR}`")

    run_id = fire_webhook()
    if run_id:
        fetch_execution_status(run_id)

    summary("- Verdict source: Aiden `mcp-tf-governance.validate_tf_governance`.")

    t0 = time.time()
    try:
        verdict = call_validate()
    except Exception as e:  # noqa: BLE001
        summary(f"\n**Result: ERROR (fail-closed)** — could not obtain a verdict from Aiden: `{e}`")
        if run_id:
            summary(f"See the Aiden run: {watch_url(run_id)}")
        return 1
    dt = int(time.time() - t0)

    v = (verdict.get("verdict") or "ERROR").upper()
    gates = verdict.get("gates", {})
    gate_line = " · ".join(f"{k}={val}" for k, val in gates.items()) if gates else "n/a"
    scanned = verdict.get("scanned_dirs", [TF_DIR])
    findings = (verdict.get("findings") or "").strip()
    plan_error = (verdict.get("plan_error") or "").strip()

    summary(f"- Gates: `{gate_line}` · scanned: `{scanned}` · {dt}s")
    if run_id:
        summary(f"- Aiden watch: {watch_url(run_id)}")
    if v == "PASS":
        summary(f"\n**Result: PASS ✅** — `{ENVIRONMENT}` governance passed. "
                "Deploy (plan-only) may proceed after approval.")
        return 0

    summary(f"\n**Result: {v} ❌** — `{ENVIRONMENT}` governance FAILED. No approval / deploy.")
    if plan_error:
        summary("\n<details><summary>terraform plan error</summary>\n\n```\n"
                + plan_error[:3000] + "\n```\n</details>")
    if findings:
        summary("\n<details><summary>findings</summary>\n\n```\n"
                + findings[:4000] + "\n```\n</details>")
    return 1


if __name__ == "__main__":
    sys.exit(main())
