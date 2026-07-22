# `pr-governance-demo` — deliberately non-compliant Terraform (bypass-path demo)

> **DANGER — DO NOT APPLY.** Every resource here is intentionally insecure. This
> directory exists only to be **planned** so the governance gate **FAILS**, which
> is exactly the point of the demo.

## What this is

This is the fixture for the GitHub **"PR governance scan"** bypass/backstop demo.
It mirrors the GitLab `notify_aiden_mr_governance` path but for GitHub PRs:

1. A developer opens a PR **directly** against `main`, bypassing the sanctioned
   pre-PR gate (`mcp-tf-governance.submit_tf_pr`).
2. The `pr-governance.yml` workflow runs the SAME plan-based gate
   (`governance/scan-tf.sh` → `terraform plan` → `trivy` + `conftest`) as a
   **backstop**, and it FAILs on this scenario.
3. The `notify-aiden` job POSTs a `pr_governance_scan` payload to the Aiden 2.0
   webhook ("Github PR governance scan"), which drives the `platform-engineer`
   agent to review and report PASS/FAIL.

## Why it is plannable anywhere

- **Local backend** (no remote S3 state / lock table) so it plans with only AWS
  creds and never touches the real state.
- Uses `data "aws_vpc" { default = true }`, `data "aws_subnets"` and
  `data "aws_ami"` so it needs no pre-existing stack — just an account with a
  default VPC (read at plan time).
- Region pinned to **us-east-1** so the region gate PASSES and the **CSPM** and
  **mandatory-tags** gates are the ones that FAIL (clearer signal).

## The intentional violations

| Resource | Violation | Caught by |
|----------|-----------|-----------|
| `aws_s3_bucket.public_assets` | no `Owner`/`CostCenter`/`Environment` tags | rego `MANDATORY-TAGS` |
| `aws_s3_bucket_public_access_block.public_assets` | all four flags `false` | trivy + rego `CSPM` |
| `aws_s3_bucket_acl.public_assets` | `public-read` ACL | trivy |
| `aws_s3_bucket_server_side_encryption_configuration.public_assets` | `AES256` (SSE-S3), not `aws:kms` CMK | rego `CSPM` |
| `aws_security_group.open` | ingress 22 **and** 3389 from `0.0.0.0/0`; no tags | trivy + rego `CSPM` + `MANDATORY-TAGS` |
| `aws_instance.demo` | unencrypted `root_block_device`; IMDSv1 (`http_tokens=optional`); no tags | trivy + rego `CSPM` + `MANDATORY-TAGS` |

## Run the gate locally

From the repo root (where `governance/` lives):

```bash
governance/scan-tf.sh scenarios/pr-governance-demo --json /tmp/gate-result.json
# expected: exit code 1 (FAIL)
```

Expected result: **FAIL** (exit 1) — trivy reports HIGH/CRITICAL misconfigs and
conftest denies name the S3 / EC2 / security-group resources above.
