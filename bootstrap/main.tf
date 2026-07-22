##############################################################################
# Remote-state backend bootstrap
#
# Provisions the S3 bucket + DynamoDB lock table that every environment
# (dev/stage/prod) consumes as its remote backend. Applied ONCE with a local
# backend. Everything here is encrypted with a customer-managed KMS key (CMK)
# with key rotation, versioned, and fully blocked from public access so that it
# also satisfies the same governance posture the demo enforces on workloads.
##############################################################################

locals {
  state_bucket = "${var.base_name}-state"
  lock_table   = "${var.base_name}-locks"
}

# ---------------------------------------------------------------------------
# CMK used to encrypt the state bucket (and its contents).
# ---------------------------------------------------------------------------
resource "aws_kms_key" "state" {
  description             = "${var.base_name} terraform remote-state encryption CMK"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name = "${var.base_name}-state"
  }
}

resource "aws_kms_alias" "state" {
  name          = "alias/${var.base_name}-state"
  target_key_id = aws_kms_key.state.key_id
}

# ---------------------------------------------------------------------------
# Versioned, encrypted, non-public state bucket.
# ---------------------------------------------------------------------------
resource "aws_s3_bucket" "state" {
  bucket = local.state_bucket

  tags = {
    Name = local.state_bucket
  }
}

resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  bucket = aws_s3_bucket.state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.state.arn
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "state" {
  bucket                  = aws_s3_bucket.state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ---------------------------------------------------------------------------
# DynamoDB state-lock table.
# ---------------------------------------------------------------------------
resource "aws_dynamodb_table" "locks" {
  name         = local.lock_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.state.arn
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name = local.lock_table
  }
}
