terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_kms_key" "assets" {
  description             = "CMK for S3 assets bucket"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  tags = {
    Owner       = "platform"
    CostCenter  = "FE-DEMO"
    Environment = "dev"
  }
}

resource "aws_kms_alias" "assets" {
  name          = "alias/s3-assets-cmk"
  target_key_id = aws_kms_key.assets.key_id
}

resource "aws_s3_bucket" "assets" {
  bucket = var.bucket_name
  tags = {
    Owner       = "platform"
    CostCenter  = "FE-DEMO"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "assets" {
  bucket = aws_s3_bucket.assets.id
  versioning_configuration {
    status = "Enabled"
  }
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

resource "aws_s3_bucket_public_access_block" "assets" {
  bucket                  = aws_s3_bucket.assets.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
