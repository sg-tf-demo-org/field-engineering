
resource "aws_kms_key" "fe_demo_assets" {
  description             = "fe-demo assets cmk"
  enable_key_rotation     = true
  deletion_window_in_days = 7
  tags = {
    Owner       = "platform"
    CostCenter  = "FE-DEMO"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "fe_demo_assets" {
  bucket_prefix = "fe-demo-assets-"
  tags = {
    Owner       = "platform"
    CostCenter  = "FE-DEMO"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "fe_demo_assets" {
  bucket = aws_s3_bucket.fe_demo_assets.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.fe_demo_assets.arn
    }
  }
}

resource "aws_s3_bucket_public_access_block" "fe_demo_assets" {
  bucket                  = aws_s3_bucket.fe_demo_assets.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
