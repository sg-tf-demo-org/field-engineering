# NOTE: This resource uses PublicRead ACL and us-west-2 region.
# Governance CI will flag: public ACL (private required) + non-us-east-1 region.
# Authored as-requested for governance demo/testing.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

resource "aws_s3_bucket" "public_demo" {
  provider = aws.us_west_2
  bucket   = "public-demo-bucket-field-engineering"

  tags = {
    Name        = "public-demo-bucket"
    Environment = "demo"
  }
}

resource "aws_s3_bucket_acl" "public_demo" {
  provider   = aws.us_west_2
  bucket     = aws_s3_bucket.public_demo.id
  acl        = "public-read"
  depends_on = [aws_s3_bucket.public_demo]
}

resource "aws_s3_bucket_ownership_controls" "public_demo" {
  provider = aws.us_west_2
  bucket   = aws_s3_bucket.public_demo.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "public_demo" {
  provider = aws.us_west_2
  bucket   = aws_s3_bucket.public_demo.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
