resource "aws_iam_user_policy_attachment" "aiden2_arn_aws_iam__aws_policy_readonlyaccess" {
  user = "aiden2"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user_policy_attachment" "grafana_cloudwatch_eks_arn_aws_iam__697091778198_policy_grafanacloudwatcheksread" {
  user = "grafana-cloudwatch-eks"
  policy_arn = "arn:aws:iam::697091778198:policy/GrafanaCloudWatchEksRead"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user_policy_attachment" "ocp_ipi_aiden_sno_installer_arn_aws_iam__aws_policy_administratoraccess" {
  user = "ocp-ipi-aiden-sno-installer"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  lifecycle {
    ignore_changes = all
  }
}
