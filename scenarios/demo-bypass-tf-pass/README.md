# demo-bypass-tf-pass (COMPLIANT)

Compliant Terraform used by `scripts/demo-governance/raise_tf_pass_pr.py` to
demonstrate the GitHub PR bypass/backstop path on a change that should PASS.

- Opened as a direct PR (bypassing Aiden's pre-PR `submit_tf_pr` gate).
- The `pr-governance.yml` stage gate runs the PLAN-BASED gate
  (`terraform plan` -> `terraform show -json` -> Trivy + conftest) and posts to
  the Aiden 2.0 **Github PR governance scan** webhook.
- The gate is **plan-only** and never runs `terraform apply`.

Expected verdict: **PASS** — CMK + rotation, S3 aws:kms CMK encryption, full
PublicAccessBlock, tags Owner/CostCenter/Environment, region us-east-1.
