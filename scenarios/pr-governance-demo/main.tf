##############################################################################
# DELIBERATELY NON-COMPLIANT scenario for the GitHub "PR governance scan"
# bypass-path demo. Every resource below violates the org governance gate
# (governance/scan-tf.sh -> trivy HIGH/CRITICAL + conftest rego).
#
# DO NOT APPLY. This exists only to be PLANNED so the plan-based gate FAILS,
# proving the CI backstop + Aiden webhook fire when a bad PR bypasses the
# pre-PR (mcp-tf-governance) gate.
##############################################################################

# --- Default VPC / subnet + AMI lookups (read at plan time; need AWS creds) --
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_ami" "al2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ---------------------------------------------------------------------------
# VIOLATION 1 — public, unencrypted, untagged S3 bucket.
#   * public-read ACL                              (trivy: public bucket)
#   * public access block with ALL flags false     (trivy + rego CSPM)
#   * SSE-S3 (AES256), NOT customer-managed KMS     (rego CSPM)
#   * no Owner / CostCenter / Environment tags      (rego MANDATORY-TAGS)
# ---------------------------------------------------------------------------
resource "aws_s3_bucket" "public_assets" {
  bucket = var.bucket_name

  # NOTE: intentionally no `tags` — mandatory-tags gate must fire.
}

resource "aws_s3_bucket_public_access_block" "public_assets" {
  bucket = aws_s3_bucket.public_assets.id

  block_public_acls       = false
  block_public_policy      = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "public_assets" {
  bucket = aws_s3_bucket.public_assets.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "public_assets" {
  depends_on = [
    aws_s3_bucket_ownership_controls.public_assets,
    aws_s3_bucket_public_access_block.public_assets,
  ]

  bucket = aws_s3_bucket.public_assets.id
  acl    = "public-read"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "public_assets" {
  bucket = aws_s3_bucket.public_assets.id

  rule {
    apply_server_side_encryption_by_default {
      # SSE-S3, not aws:kms with a CMK — rego CSPM denies this.
      sse_algorithm = "AES256"
    }
  }
}

# ---------------------------------------------------------------------------
# VIOLATION 2 — security group open to the world on SSH (22) AND RDP (3389).
#   * ingress 22 from 0.0.0.0/0                     (trivy + rego CSPM)
#   * ingress 3389 from 0.0.0.0/0                   (trivy + rego CSPM)
#   * no required tags                              (rego MANDATORY-TAGS)
#
# Ingress is expressed with the modern standalone
# `aws_vpc_security_group_ingress_rule` resources (not inline `ingress {}`
# blocks) so the rego CSPM policy evaluates each rule via its `cidr_ipv4`
# field and emits a clean, resource-named deny.
# ---------------------------------------------------------------------------
resource "aws_security_group" "open" {
  name        = "pr-gov-demo-open-sg"
  description = "DEMO ONLY - intentionally wide open, never apply"
  vpc_id      = data.aws_vpc.default.id

  # NOTE: intentionally no `tags` — mandatory-tags gate must fire.
}

resource "aws_vpc_security_group_ingress_rule" "ssh_world" {
  security_group_id = aws_security_group.open.id
  description       = "SSH from the world (violation)"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "rdp_world" {
  security_group_id = aws_security_group.open.id
  description       = "RDP from the world (violation)"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3389
  to_port           = 3389
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "all_world" {
  security_group_id = aws_security_group.open.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ---------------------------------------------------------------------------
# VIOLATION 3 — EC2 instance: unencrypted root volume, IMDSv1 allowed, no tags,
# attached to the wide-open security group above.
#   * root_block_device.encrypted = false          (trivy + rego CSPM)
#   * metadata http_tokens = optional (IMDSv1)      (trivy)
#   * no required tags                              (rego MANDATORY-TAGS)
# ---------------------------------------------------------------------------
resource "aws_instance" "demo" {
  ami                    = data.aws_ami.al2.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.open.id]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional" # IMDSv1 allowed (violation)
  }

  root_block_device {
    volume_size = 8
    encrypted   = false # unencrypted root volume (violation)
  }

  # NOTE: intentionally no `tags` — mandatory-tags gate must fire.
}
