# Aiden-gated progressive deploy (Model A)

GitHub Actions **orchestrates and sequences** the deploy; **Aiden is the governance
brain and reporter**. Every environment must clear an Aiden governance gate and a
human approval before anything is applied.

## Pipeline (`.github/workflows/deploy.yml`)

Per environment there are three visible stages, run strictly in order:

```
Governance - dev  →  Approve - dev  →  Deploy - dev
        →  Governance - stage  →  Approve - stage  →  Deploy - stage
        →  Governance - prod   →  Approve - prod   →  Deploy - prod
```

| Stage | What it does | AWS role? | Applies? |
|-------|--------------|-----------|----------|
| **Governance - <env>** | Reusable `governance.yml` → `scripts/aiden_gate.py`. Fires the Aiden webhook (watch URL) **and** calls `mcp-tf-governance.validate_tf_governance(tf_dir=environments/<env>)` for a deterministic verdict. `terraform plan + Trivy + Rego` run **under the hood** inside Aiden. Fail-closed. | No (`contents: read` only) | No |
| **Approve - <env>** | Native **GitHub Environment** required-reviewer gate. A human must approve. | No | No |
| **Deploy - <env>** | Self-hosted runner assumes `<env>-fe-infra-otel-demo-deploy` via OIDC and runs `terraform apply`. | Yes (OIDC) | **Yes — only here** |

A failing gate blocks its Approve/Deploy and every later environment. `terraform apply`
never runs on the gate or PR path.

## Why the gate calls the MCP directly for the verdict

The Guild executions API only exposes `status` + an (empty) `structured_output` — it
does not return the agent's final message or nodes, so polling a webhook run can never
yield a reliable verdict. So the gate:

- **fires the webhook** to create a watchable Aiden agent execution (the deep-link
  "watch" URL printed in the job summary — the *reporter*), and
- **calls `mcp-tf-governance.validate_tf_governance` directly** over streamable-HTTP for
  a synchronous, deterministic PASS/FAIL/ERROR verdict (the *brain*).

Both are Aiden: `mcp-tf-governance` is an Aiden 2.0 MCP integration that runs Trivy and
terraform plan internally. CI never runs Trivy/terraform/conftest or assumes a role on
the gate path.

## Required repo secrets

| Secret | Purpose |
|--------|---------|
| `AIDEN_TF_GOV_MCP_URL` | Governance MCP endpoint (streamable-HTTP) |
| `AIDEN_TF_GOV_MCP_TOKEN` | MCP ingress bearer token |
| `AIDEN_DEPLOY_GATE_WEBHOOK_URL` | Aiden deploy-gate webhook (reporter / watch URL) |

## GitHub Environments

`dev`, `stage`, `prod` each have a **required reviewer**. Approve pending deployments in
the run's *Review deployments* prompt (or the environment's page).

## Self-hosted runner

`Deploy - <env>` uses `runs-on: [self-hosted]`. Register a self-hosted runner (the
`fe-infra-otel-demo` runner EC2) before the deploy stages can complete; otherwise they
queue after approval — the governance + approval gating still demonstrates fully.
