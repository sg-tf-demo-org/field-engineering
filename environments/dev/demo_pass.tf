##############################################################################
# DEMO (PASS): a governance-clean S3 assets bucket for the dev environment.
#   - customer-managed KMS key (CMK) with rotation enabled
#   - full S3 PublicAccessBlock (all four flags true)
#   - server-side encryption with aws:kms + the CMK
#   - org-required tags (Owner / CostCenter / Environment) via local.tags
# Region us-east-1 (inherited from the provider). Passes trivy + conftest.
##############################################################################

resource "aws_kms_key" "demo_assets" {
  description             = "${local.name_prefix} demo assets bucket CMK"
  enable_key_rotation     = true
  deletion_window_in_days = 7
  tags                    = local.tags
}

resource "aws_s3_bucket" "demo_assets" {
  bucket = "${local.name_prefix}-assets"
  tags   = local.tags
}

resource "aws_s3_bucket_public_access_block" "demo_assets" {
  bucket                  = aws_s3_bucket.demo_assets.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "demo_assets" {
  bucket = aws_s3_bucket.demo_assets.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.demo_assets.arn
    }
    bucket_key_enabled = true
  }
}
