# Aiden-gated progressive deploy (Model A)

GitHub Actions **orchestrates and sequences** the deploy; **Aiden is the governance
brain and reporter**. Every environment must clear an Aiden governance gate and a
human approval before anything is planned.

## Pipeline (`.github/workflows/deploy.yml`)

Per environment there are three visible stages, run strictly in order:

```
Governance - dev  →  Approve - dev  →  Deploy - dev (plan-only)
        →  Governance - stage  →  Approve - stage  →  Deploy - stage (plan-only)
        →  Governance - prod   →  Approve - prod   →  Deploy - prod (plan-only)
```

| Stage | What it does | AWS role? | Applies? |
|-------|--------------|-----------|----------|
| **Governance - <env>** | Reusable `governance.yml` → `scripts/aiden_gate.py`. Fires the dedicated **Github deploy governance gate** webhook (watch URL + fetched execution status) **and** calls `mcp-tf-governance.validate_tf_governance(tf_dir=environments/<env>)` for a deterministic verdict. `terraform plan + Trivy + Rego` run **under the hood** inside Aiden. Fail-closed. | No (`contents: read` only) | No |
| **Approve - <env>** | Native **GitHub Environment** required-reviewer gate. A human must approve. | No | No |
| **Deploy - <env>** | `ubuntu-latest` assumes `<env>-fe-infra-otel-demo-deploy` via OIDC and runs **`terraform plan` only**. `terraform apply` is intentionally commented out. | Yes (OIDC) | **No (plan-only)** |

A failing gate blocks its Approve/Deploy and every later environment. `terraform apply`
never runs on the gate, PR, or deploy path in this demo.

## Why the gate calls the MCP directly for the verdict

The Guild executions API only exposes `status` + an (empty) `structured_output` — it
does not return the agent's final message or findings, so polling a webhook run alone
cannot yield a reliable PASS/FAIL. So the gate:

- **fires the dedicated deploy-gate webhook** to create a watchable Aiden agent
  execution (the deep-link "watch" URL + fetched execution status printed in the
  job summary — the *reporter*), and
- **calls `mcp-tf-governance.validate_tf_governance` directly** over streamable-HTTP for
  a synchronous, deterministic PASS/FAIL/ERROR verdict (the *brain*).

Both are Aiden: `mcp-tf-governance` is an Aiden 2.0 MCP integration that runs Trivy and
terraform plan internally. CI never runs Trivy/terraform/conftest or assumes a role on
the gate path.

## Dedicated reporter webhook

Do **not** reuse `Github PR governance scan` for deploy gates — that action prompt
ignores `main` / non-PR payloads and refuses. Use **Github deploy governance gate**
(Automations webhook targeting `platform-engineer`, event=`deploy_governance_gate`).

## Required repo secrets

| Secret | Purpose |
|--------|---------|
| `AIDEN_TF_GOV_MCP_URL` | Governance MCP endpoint (streamable-HTTP) |
| `AIDEN_TF_GOV_MCP_TOKEN` | MCP ingress bearer token |
| `AIDEN_DEPLOY_GATE_WEBHOOK_URL` | Dedicated deploy-gate webhook (reporter / watch URL) |
| `AIDEN_GUILD_TOKEN` | Optional Guild API token to fetch execution status |
| `AIDEN_ORG_ID` | Optional Guild org id for the execution fetch |

## GitHub Environments

`dev`, `stage`, `prod` each have a **required reviewer**. Approve pending deployments in
the run's *Review deployments* prompt (or the environment's page).

## Plan-only deploy

`Deploy - <env>` runs on `ubuntu-latest` with OIDC. It runs `terraform init` +
`terraform plan`. The `terraform apply` line is commented out so the progressive
Governance → Approve → Deploy demo completes end-to-end without mutating AWS.
