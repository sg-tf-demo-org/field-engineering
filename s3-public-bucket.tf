# NOTE: This configuration contains policy violations that will be flagged by CI:
#   1. PublicRead ACL — public exposure is prohibited by org governance
#   2. us-west-2 region — only us-east-1 is permitted
#   3. SSE-S3 encryption — customer-managed KMS (CMK) is required
# Authored as-requested; governance gate will flag these violations.

resource "aws_s3_bucket" "public_bucket" {
  bucket = "field-engineering-public-bucket"

  tags = {
    Name        = "field-engineering-public-bucket"
    Environment = "demo"
  }
}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "public_bucket_sse" {
  bucket = aws_s3_bucket.public_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}
