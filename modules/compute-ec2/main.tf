##############################################################################
# Free-tier demo workload EC2 (t3.micro) in a private subnet.
#   - CMK-encrypted root volume (rotation enabled)
#   - IMDSv2 required (no ingress from the world)
##############################################################################

data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# CMK for EBS encryption.
resource "aws_kms_key" "ebs" {
  description             = "${var.name_prefix} EBS encryption CMK"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-ebs"
  })
}

resource "aws_kms_alias" "ebs" {
  name          = "alias/${var.name_prefix}-ebs"
  target_key_id = aws_kms_key.ebs.key_id
}

# Security group: no inbound; egress only.
resource "aws_security_group" "this" {
  name        = "${var.name_prefix}-workload"
  description = "${var.name_prefix} demo workload SG (no public ingress)"
  vpc_id      = var.vpc_id

  egress {
    description = "Allow all egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-workload"
  })
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name = "${var.name_prefix}-workload"

  ami                    = data.aws_ssm_parameter.al2023.value
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]

  # IMDSv2 required.
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 8
      encrypted   = true
      kms_key_id  = aws_kms_key.ebs.arn
    }
  ]

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-workload"
  })
}
