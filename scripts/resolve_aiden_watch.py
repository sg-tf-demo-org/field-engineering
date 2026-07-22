#!/usr/bin/env python3
"""Resolve the Aiden UI watch URL for a governance webhook fire.

The webhook trigger returns a `run_id`, but that id is NOT the watchable
execution id in the UI (`…/executions/{id}/watch` → "execution not found").

The watchable id is the `trace_id` from `GET /guild/api/v1/executions` (no
dashes). We correlate by finding a recent execution whose prompt embeds our
payload marker (typically `run_url`, or a unique `correlation_id`).
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
GUILD_TOKEN = env("AIDEN_GUILD_TOKEN")


def watch_url(trace_id: str) -> str:
    rid = (trace_id or "").replace("-", "")
    return f"{GUILD_BASE}/app/settings/workspace/devops-copilot/executions/{rid}/watch"


def _list_executions(limit: int = 40) -> list[dict]:
    if not GUILD_TOKEN:
        return []
    url = f"{GUILD_BASE}/guild/api/v1/executions?limit={limit}&orgId={ORG_ID}"
    req = urllib.request.Request(
        url,
        headers={
            "Authorization": f"Bearer {GUILD_TOKEN}",
            "x-org-id": ORG_ID,
            "Accept": "application/json",
        },
        method="GET",
    )
    with urllib.request.urlopen(req, timeout=30) as resp:
        return json.loads(resp.read().decode() or "[]")


def resolve_trace_id(marker: str, timeout_s: int = 90, interval_s: float = 3.0) -> str:
    """Return the list `trace_id` whose prompt contains `marker`, or \"\"."""
    if not marker or not GUILD_TOKEN:
        return ""
    deadline = time.time() + timeout_s
    last_err = ""
    while time.time() < deadline:
        try:
            for it in _list_executions():
                prompt = it.get("prompt") or ""
                if marker in prompt:
                    return (it.get("trace_id") or "").strip()
        except Exception as e:  # noqa: BLE001
            last_err = str(e)
        time.sleep(interval_s)
    if last_err:
        print(f"resolve_trace_id: last error: {last_err}", file=sys.stderr)
    return ""


def main() -> int:
    """CLI: resolve_aiden_watch.py <marker>  → prints watch URL (or empty)."""
    marker = sys.argv[1] if len(sys.argv) > 1 else env("AIDEN_WATCH_MARKER")
    if not marker:
        print("usage: resolve_aiden_watch.py <marker>", file=sys.stderr)
        return 2
    timeout = int(env("AIDEN_WATCH_RESOLVE_TIMEOUT", default="90"))
    tid = resolve_trace_id(marker, timeout_s=timeout)
    if not tid:
        return 1
    print(watch_url(tid))
    return 0


if __name__ == "__main__":
    sys.exit(main())
