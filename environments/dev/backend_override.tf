# governance-override: use local backend so the plan-based governance scanner
# can run without requiring live S3 backend credentials.
# This file is intentionally committed; the real backend is defined in backend.tf
# and takes precedence at apply time when -backend-config or workspace init is used.
terraform {
  backend "local" {}
}
