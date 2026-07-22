# DEMO PASS — compliant Terraform that bypassed Aiden's pre-PR gate but should
# still PASS the plan-based CI / Github PR governance scan backstop.
# DO NOT APPLY. The stage gate scans the PLAN only.

resource "aws_kms_key" "assets" {
  description             = "demo-pass CMK for assets bucket"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Owner       = "platform"
    CostCenter  = "FE-DEMO"
    Environment = "dev"
  }
}

resource "aws_kms_alias" "assets" {
  name          = "alias/dev-fe-infra-otel-demo-demo-pass-assets"
  target_key_id = aws_kms_key.assets.key_id
}

resource "aws_s3_bucket" "assets" {
  bucket        = "dev-fe-infra-otel-demo-demo-pass-assets"
  force_destroy = true

  tags = {
    Owner       = "platform"
    CostCenter  = "FE-DEMO"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_public_access_block" "assets" {
  bucket                  = aws_s3_bucket.assets.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "assets" {
  bucket = aws_s3_bucket.assets.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.assets.arn
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_versioning" "assets" {
  bucket = aws_s3_bucket.assets.id
  versioning_configuration {
    status = "Enabled"
  }
}
