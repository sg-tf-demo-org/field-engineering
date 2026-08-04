resource "aws_cloudwatch_metric_alarm" "cicd_overwatch_jenkins_public_login_rate_limited" {
  alarm_name = "cicd-overwatch-jenkins-public-login-rate-limited"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "BlockedRequests"
  namespace = "AWS/WAFV2"
  period = 300
  statistic = "Sum"
  threshold = 0
  alarm_description = "Jenkins public login path exceeded the AWS WAF source-IP rate limit."
  tags = {
    Environment = "demo"
    ManagedBy = "terraform"
    Project = "CICD-Overwatch"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_metric_alarm" "cicd_overwatch_jenkins_public_missing_agent_secret" {
  alarm_name = "cicd-overwatch-jenkins-public-missing-agent-secret"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "BlockedRequests"
  namespace = "AWS/WAFV2"
  period = 300
  statistic = "Sum"
  threshold = 25
  alarm_description = "Public Jenkins requests are being blocked because they are missing the required agent secret header."
  tags = {
    Environment = "demo"
    ManagedBy = "terraform"
    Project = "CICD-Overwatch"
  }
  lifecycle {
    ignore_changes = all
  }
}
