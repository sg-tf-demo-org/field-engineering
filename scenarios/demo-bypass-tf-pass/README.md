# scenarios/demo-bypass-tf-pass

Adds a CMK-encrypted S3 assets bucket (with key rotation, full PublicAccessBlock,
and mandatory tags) for the field-engineering otel demo stack in us-east-1.

Raised by `scripts/demo-governance/raise_tf_pass_pr.py` as a direct GitHub PR.
The `pr-governance.yml` workflow runs the plan-based gate
(`terraform plan` → `terraform show -json` → Trivy + conftest) and posts to the
Aiden 2.0 **Github PR governance scan** webhook. The gate is plan-only and never
runs `terraform apply`.
