# field-engineering — Terraform IaC governance demo

Terraform replica of the live `field-engineering` EKS Auto Mode platform, deployed
across `dev` / `stage` / `prod` in AWS account `697091778198` (`us-east-1`) and gated
end-to-end by a **plan-based** governance gate (Trivy + Conftest/Rego over
`terraform show -json`).

This is the Terraform sibling of the CDK/CFN governance flows. Every change is
proven against a real `terraform plan` — never HCL heuristics — before a PR can be
opened (via the Aiden `mcp-tf-governance` `submit_tf_pr` tool) and again in CI
before any environment is applied.

## What it provisions (per environment)

| Component | Module | Notes |
|-----------|--------|-------|
| Dedicated VPC (2 AZ, public/private subnets, single NAT, flow logs) | `terraform-aws-modules/vpc/aws ~>5` | never the default VPC |
| EKS **Auto Mode** cluster v1.36 | `terraform-aws-modules/eks/aws ~>20` | `general-purpose` + `system` node pools, `metrics-server`, auth mode `API`, service CIDR `10.100.0.0/16`, secrets CMK-encrypted, private endpoint |
| Free-tier demo workload EC2 (`t3.micro`) | `terraform-aws-modules/ec2-instance/aws ~>5` | CMK-encrypted EBS, IMDSv2, no public ingress |
| Self-hosted GitHub Actions runner EC2 (`t3.micro`) | `modules/runner` | registers to the repo via user-data using a short-lived token (never committed) |
| GitHub OIDC provider + per-env deploy role | `modules/github-oidc` | `*-fe-infra-otel-demo-deploy`, trust scoped to repo + environment |

Every resource is prefixed `dev-` / `stage-` / `prod-` with base name `fe-infra-otel-demo`.

## Layout

```
bootstrap/                 # one-time: S3 state bucket + DynamoDB lock table (local backend)
modules/
  networking/              # VPC
  eks/                     # EKS Auto Mode
  compute-ec2/             # free-tier workload
  runner/                  # self-hosted runner EC2
  github-oidc/             # OIDC provider + deploy roles
environments/{dev,stage,prod}/
  main.tf provider.tf backend.tf variables.tf terraform.tfvars
governance/
  scan-tf.sh               # the plan-based gate
  policies/tf/*.rego       # region / tags / cspm policies (terraform-plan schema)
.github/workflows/
  governance.yml           # reusable gate (init->plan->show json->trivy+conftest)
  deploy.yml               # dev->stage->prod, per-env GitHub Environments + OIDC
```

## Remote state

`bootstrap/` (applied once, local backend) creates:
- S3 `fe-infra-otel-demo-state` — versioned, SSE-KMS (CMK), full public-access-block
- DynamoDB `fe-infra-otel-demo-locks`

Each environment's `backend.tf` uses `key = <env>/fe-infra-otel-demo.tfstate` + the lock table.

## The governance gate (non-negotiable, plan-based)

`governance/scan-tf.sh <env-dir>` always:

1. `terraform init`
2. `terraform plan -out=tfplan.binary`
3. `terraform show -json tfplan.binary > tfplan.json`
4. `trivy config` (HIGH,CRITICAL, exit 1) on the plan JSON
5. `conftest test -p governance/policies/tf` on the plan JSON

Exit `0` = PASS, `1` = FAIL, `2` = ERROR (missing plan → **fail-closed**, never PASS).

Policies enforce: us-east-1 only; mandatory `Owner`/`CostCenter`/`Environment`
tags (Environment ∈ {dev,staging,prod}); S3/EBS/EKS CMK encryption + key rotation;
full S3 public-access-block; no SG ingress on 22/3389 from `0.0.0.0/0`; no IAM
`Action:*`+`Resource:*`; no public RDS.

## Usage

```bash
export AWS_DEFAULT_REGION=us-east-1

# one-time backend
cd bootstrap && terraform init && terraform apply

# per env
cd environments/dev
terraform init
terraform validate
../../governance/scan-tf.sh .        # must PASS before apply
terraform apply

# self-hosted runner registration token (never committed)
export TF_VAR_runner_registration_token=<token-from-github-repo-settings>
terraform apply
```

## CI/CD

- `governance.yml` — reusable, plan-based gate; uploads the plan artifact; fail-closed.
- `deploy.yml` — `dev → stage → prod`, each on a self-hosted runner, each gated by
  `governance.yml` and protected by a GitHub Environment, assuming its per-env
  `*-fe-infra-otel-demo-deploy` role via OIDC. No apply if the gate fails.

Required GitHub Environments: `dev`, `stage`, `prod` (add reviewers/wait timers as
protection rules).
