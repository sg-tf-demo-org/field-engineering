# Field Engineering — provisional public assets + break-glass access (us-west-2).
# Demo ask: PublicRead ACL + default SSE-S3 (no KMS) in us-west-2.

data "aws_ami" "al2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# --- Public assets bucket (SSE-S3 only — no CMK; no mandatory tags) ---
resource "aws_s3_bucket" "public_assets" {
  bucket        = "dev-fe-infra-otel-demo-rogue-public-assets"
  force_destroy = true
  # no tags: Owner / CostCenter / Environment missing
}

resource "aws_s3_bucket_public_access_block" "public_assets" {
  bucket                  = aws_s3_bucket.public_assets.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public_assets" {
  depends_on = [aws_s3_bucket_public_access_block.public_assets]
  bucket     = aws_s3_bucket.public_assets.id
  acl        = "public-read"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "public_assets" {
  bucket = aws_s3_bucket.public_assets.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # SSE-S3 — not aws:kms CMK
    }
  }
}

# --- Break-glass SG: SSH + RDP from the internet ---
resource "aws_security_group" "open" {
  name        = "dev-fe-infra-otel-demo-rogue-open"
  description = "break-glass: world-open SSH + RDP"

  ingress {
    description = "ssh from world"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "rdp from world"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- Scratch EC2 (unencrypted root + IMDSv1, no tags) ---
resource "aws_instance" "rogue" {
  ami                    = data.aws_ami.al2.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.open.id]

  metadata_options {
    http_tokens = "optional" # IMDSv1 allowed
  }

  root_block_device {
    encrypted = false # unencrypted EBS
  }
  # no tags: Owner / CostCenter / Environment missing
}
