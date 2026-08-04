resource "aws_iam_openid_connect_provider" "arn_aws_iam__697091778198_oidc_provider_oidc_eks_us_east_1_amazonaws_com_id_472dc0376b7484fddb3a5d666717823d" {
  url = "https://oidc.eks.us-east-1.amazonaws.com/id/472DC0376B7484FDDB3A5D666717823D"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = ["9e99a48a9960c14937f5b6c6c1d2a6e2c1d2a6e2"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_openid_connect_provider" "arn_aws_iam__697091778198_oidc_provider_oidc_eks_us_west_2_amazonaws_com_id_3b526aa4b8abda36e8341c97b2c425f5" {
  url = "https://oidc.eks.us-west-2.amazonaws.com/id/3B526AA4B8ABDA36E8341C97B2C425F5"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = ["06b25927c42a721631c1efd9431e648fa62e1e39"]
  tags = {
    Environment = "production"
    ManagedBy = "terraform"
    Project = "ai-sre-demo"
    "do-not-delete" = "true"
    donotdelete = "true"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_openid_connect_provider" "arn_aws_iam__697091778198_oidc_provider_token_actions_githubusercontent_com" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1", "1c58a3a8518e8759bf075b76b750d4f2df264fcd"]
  lifecycle {
    ignore_changes = all
  }
}
