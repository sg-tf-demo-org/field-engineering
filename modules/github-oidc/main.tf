##############################################################################
# GitHub OIDC provider (account-wide, created once) + a per-env deploy role that
# the GitHub Actions pipeline assumes via aws-actions/configure-aws-credentials.
# The trust is scoped to this repo AND this GitHub Environment (least privilege).
##############################################################################

data "aws_caller_identity" "current" {}

locals {
  oidc_url  = "token.actions.githubusercontent.com"
  oidc_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_url}"
  repo_sub  = "repo:${var.github_org}/${var.github_repo}"
  role_name = "${var.name_prefix}-deploy"

  # Map the tag environment to the GitHub Environment name.
  gh_environment = var.environment == "staging" ? "stage" : var.environment
}

resource "aws_iam_openid_connect_provider" "github" {
  count = var.create_oidc_provider ? 1 : 0

  url             = "https://${local.oidc_url}"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-github-oidc"
  })
}

locals {
  provider_arn = var.create_oidc_provider ? aws_iam_openid_connect_provider.github[0].arn : local.oidc_arn
}

data "aws_iam_policy_document" "trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [local.provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_url}:aud"
      values   = ["sts.amazonaws.com"]
    }

    # Scope to the repo AND this GitHub Environment only.
    condition {
      test     = "StringLike"
      variable = "${local.oidc_url}:sub"
      values   = ["${local.repo_sub}:environment:${local.gh_environment}"]
    }
  }
}

resource "aws_iam_role" "deploy" {
  name                 = local.role_name
  assume_role_policy    = data.aws_iam_policy_document.trust.json
  max_session_duration = 3600

  tags = merge(var.tags, {
    Name = local.role_name
  })
}

# Scoped deploy permissions: broad service actions the Terraform stack needs, but
# NEVER Action:* on Resource:* (no star-star). Region-locked to us-east-1 where
# the service supports the aws:RequestedRegion condition.
data "aws_iam_policy_document" "deploy" {
  statement {
    sid    = "InfraServices"
    effect = "Allow"
    actions = [
      "ec2:*",
      "eks:*",
      "elasticloadbalancing:*",
      "autoscaling:*",
      "logs:*",
      "cloudwatch:*",
      "kms:*",
      "s3:*",
      "dynamodb:*",
      "ssm:GetParameter",
      "ssm:GetParameters",
    ]
    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestedRegion"
      values   = ["us-east-1"]
    }
  }

  statement {
    sid    = "IamForClusterAndRoles"
    effect = "Allow"
    actions = [
      "iam:GetRole",
      "iam:GetRolePolicy",
      "iam:GetInstanceProfile",
      "iam:GetOpenIDConnectProvider",
      "iam:ListRolePolicies",
      "iam:ListAttachedRolePolicies",
      "iam:ListInstanceProfilesForRole",
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:TagRole",
      "iam:UntagRole",
      "iam:PassRole",
      "iam:AttachRolePolicy",
      "iam:DetachRolePolicy",
      "iam:PutRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:CreateInstanceProfile",
      "iam:DeleteInstanceProfile",
      "iam:AddRoleToInstanceProfile",
      "iam:RemoveRoleFromInstanceProfile",
      "iam:CreateServiceLinkedRole",
      "iam:CreateOpenIDConnectProvider",
      "iam:TagOpenIDConnectProvider",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "deploy" {
  name   = "${local.role_name}-policy"
  role   = aws_iam_role.deploy.id
  policy = data.aws_iam_policy_document.deploy.json
}
