# Provisional public assets + break-glass access (non-compliant).

data "aws_ami" "al2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_s3_bucket" "public_assets" {
  bucket        = "dev-fe-aiden2-rogue-public-assets"
  force_destroy = true
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

resource "aws_security_group" "open" {
  name        = "dev-fe-aiden2-rogue-open"
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

resource "aws_instance" "rogue" {
  ami                    = data.aws_ami.al2.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.open.id]

  metadata_options {
    http_tokens = "optional"
  }

  root_block_device {
    encrypted = false
  }
}
