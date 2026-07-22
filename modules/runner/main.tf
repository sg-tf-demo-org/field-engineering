##############################################################################
# Dedicated self-hosted GitHub Actions runner EC2 (free-tier t3.micro).
# Registers to the repo at boot via user-data using a short-lived registration
# token passed in as a (sensitive) variable — the token is never committed.
##############################################################################

data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# CMK for the runner's EBS root volume.
resource "aws_kms_key" "ebs" {
  description             = "${var.name_prefix} runner EBS encryption CMK"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-runner-ebs"
  })
}

resource "aws_kms_alias" "ebs" {
  name          = "alias/${var.name_prefix}-runner-ebs"
  target_key_id = aws_kms_key.ebs.key_id
}

# Instance role: SSM management only (no standing deploy creds; deploys use OIDC).
data "aws_iam_policy_document" "assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "runner" {
  name               = "${var.name_prefix}-runner"
  assume_role_policy = data.aws_iam_policy_document.assume.json

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-runner"
  })
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.runner.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "runner" {
  name = "${var.name_prefix}-runner"
  role = aws_iam_role.runner.name
}

resource "aws_security_group" "runner" {
  name        = "${var.name_prefix}-runner"
  description = "${var.name_prefix} self-hosted runner SG (egress only)"
  vpc_id      = var.vpc_id

  egress {
    description = "Allow all egress (GitHub, package repos, AWS)"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-runner"
  })
}

locals {
  user_data = base64encode(templatefile("${path.module}/user-data.sh.tftpl", {
    repo_url = var.github_repo_url
    token    = var.runner_registration_token
    labels   = var.runner_labels
    name     = "${var.name_prefix}-runner"
  }))
}

module "runner" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name = "${var.name_prefix}-runner"

  ami                    = data.aws_ssm_parameter.al2023.value
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.runner.id]
  iam_instance_profile   = aws_iam_instance_profile.runner.name
  user_data_base64       = local.user_data

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 20
      encrypted   = true
      kms_key_id  = aws_kms_key.ebs.arn
    }
  ]

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-runner"
  })
}
