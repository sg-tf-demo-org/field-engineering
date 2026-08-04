resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_ai_sre_demo_deploy_policy" {
  name = "ai-sre-demo-deploy-policy"
  policy = "{\"Statement\":[{\"Action\":[\"ecr:GetAuthorizationToken\",\"ecr:BatchCheckLayerAvailability\",\"ecr:GetDownloadUrlForLayer\",\"ecr:BatchGetImage\",\"ecr:InitiateLayerUpload\",\"ecr:UploadLayerPart\",\"ecr:CompleteLayerUpload\",\"ecr:PutImage\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"eks:DescribeCluster\",\"eks:AccessKubernetesApi\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:us-west-2:697091778198:cluster/ai-sre-demo\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
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

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_ai_sre_demo_release_orchestrator" {
  name = "ai-sre-demo-release-orchestrator"
  policy = "{\"Statement\":[{\"Action\":[\"eks:DescribeCluster\",\"eks:AccessKubernetesApi\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:us-west-2:697091778198:cluster/ai-sre-demo\"},{\"Action\":[\"ecr:DescribeImages\",\"ecr:BatchGetImage\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ecr:us-west-2:697091778198:repository/ai-sre-demo/api-gateway\",\"arn:aws:ecr:us-west-2:697091778198:repository/ai-sre-demo/auth-service\",\"arn:aws:ecr:us-west-2:697091778198:repository/ai-sre-demo/billing-service\",\"arn:aws:ecr:us-west-2:697091778198:repository/ai-sre-demo/load-simulator\",\"arn:aws:ecr:us-west-2:697091778198:repository/ai-sre-demo/worker-service\"]},{\"Action\":[\"ssm:GetParameter\",\"ssm:PutParameter\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ssm:us-west-2:697091778198:parameter/ai-sre-demo/release-orchestrator/state\",\"arn:aws:ssm:us-west-2:697091778198:parameter/ai-sre-demo/release-orchestrator/datadog-api-key\"]}],\"Version\":\"2012-10-17\"}"
  path = "/"
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

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_allowexternaldnsupdates" {
  name = "AllowExternalDNSUpdates"
  policy = "{\"Statement\":[{\"Action\":[\"route53:ChangeResourceRecordSets\",\"route53:ListResourceRecordSets\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:route53:::hostedzone/*\"]},{\"Action\":[\"route53:ListHostedZones\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]},{\"Action\":[\"route53:ListHostedZonesByName\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]},{\"Action\":[\"route53:ListTagsForResource\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:route53:::hostedzone/*\"]}],\"Version\":\"2012-10-17\"}"
  path = "/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_ecstaskexecutionrolepolicy" {
  name = "ecsTaskExecutionRolePolicy"
  policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"],\"Sid\":\"Statement1\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_grafanacloudwatcheksread" {
  name = "GrafanaCloudWatchEksRead"
  policy = "{\"Statement\":[{\"Action\":[\"logs:StartQuery\",\"logs:StopQuery\",\"logs:GetQueryResults\",\"logs:DescribeQueries\",\"logs:DescribeQueryDefinitions\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"LogsInsightsQuery\"},{\"Action\":[\"logs:GetLogEvents\",\"logs:FilterLogEvents\",\"logs:GetLogRecord\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/eks/field-engineering\",\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/eks/field-engineering/*\",\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/vpc/field-engineering\",\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/vpc/field-engineering/*\",\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/apprunner/*\"],\"Sid\":\"LogsRead\"},{\"Action\":[\"logs:DescribeLogGroups\",\"logs:DescribeLogStreams\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"LogsListGlobal\"},{\"Action\":[\"cloudwatch:GetMetricData\",\"cloudwatch:GetMetricStatistics\",\"cloudwatch:ListMetrics\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"CloudWatchMetricsRead\"},{\"Action\":[\"ec2:DescribeRegions\",\"ec2:DescribeAvailabilityZones\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"Ec2Regions\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_grafanacloudwatchlogsinsights_field_engineering" {
  name = "GrafanaCloudWatchLogsInsights-field-engineering"
  policy = "{\"Statement\":[{\"Action\":[\"logs:StartQuery\",\"logs:StopQuery\",\"logs:GetQueryResults\",\"logs:DescribeQueries\",\"logs:DescribeQueryDefinitions\",\"logs:DescribeLogGroups\",\"logs:DescribeLogStreams\",\"logs:GetLogEvents\",\"logs:FilterLogEvents\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/vpc/field-engineering\",\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/vpc/field-engineering:*\"],\"Sid\":\"LogsInsightsQueryFieldEngineering\"},{\"Action\":[\"logs:DescribeLogGroups\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"LogsListLogGroupsDescribe\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_service_role_aidevopsallowawssupportactionspolicy_ev5gkf1t" {
  name = "AIDevOpsAllowAwsSupportActionsPolicy-ev5gkf1t"
  policy = "{\"Statement\":[{\"Action\":[\"iam:CreateServiceLinkedRole\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::697091778198:role/aws-service-role/resource-explorer-2.amazonaws.com/AWSServiceRoleForResourceExplorer\"],\"Sid\":\"AllowCreateServiceLinkedRoles\"}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_service_role_aidevopsallowawssupportactionspolicy_f3a9z521" {
  name = "AIDevOpsAllowAwsSupportActionsPolicy-f3a9z521"
  policy = "{\"Statement\":[{\"Action\":[\"iam:CreateServiceLinkedRole\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::697091778198:role/aws-service-role/resource-explorer-2.amazonaws.com/AWSServiceRoleForResourceExplorer\"],\"Sid\":\"AllowCreateServiceLinkedRoles\"}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_service_role_aidevopsallowawssupportactionspolicy_uhhwuxk3" {
  name = "AIDevOpsAllowAwsSupportActionsPolicy-uhhwuxk3"
  policy = "{\"Statement\":[{\"Action\":[\"iam:CreateServiceLinkedRole\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::697091778198:role/aws-service-role/resource-explorer-2.amazonaws.com/AWSServiceRoleForResourceExplorer\"],\"Sid\":\"AllowCreateServiceLinkedRoles\"}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_service_role_aidevopsallowsecretsmanageractionspolicy_06973bfcaa13" {
  name = "AIDevOpsAllowSecretsManagerActionsPolicy-06973bfcaa13"
  policy = "{\"Statement\":[{\"Action\":\"secretsmanager:GetSecretValue\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:secretsmanager:us-west-2:697091778198:secret:aidevops/5ac278ef-da36-447b-8af1-06973bfcaa13/*\",\"Sid\":\"AllowSecretsManagerActions\"}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_service_role_aidevopsiamoperatorprodidcactionspolicy_me206xs1" {
  name = "AIDevOpsIAMOperatorProdIDCActionsPolicy-me206xs1"
  policy = "{\"Statement\":[{\"Action\":[\"sso:ListInstances\",\"sso:DescribeInstance\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AllowDevOpsAgentSSOAccess\"},{\"Action\":\"identitystore:DescribeUser\",\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:identitystore::368945481389:identitystore/*\",\"arn:aws:identitystore:::user/*\"],\"Sid\":\"AllowDevOpsAgentIDCUserAccess\"}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_policy" "arn_aws_iam__697091778198_policy_service_role_aidevopsidcoperatoractionspolicy_e9574eef50c0_a9chqv88" {
  name = "AIDevOpsIDCOperatorActionsPolicy-e9574eef50c0-a9chqv88"
  policy = "{\"Statement\":[{\"Action\":\"identitystore:DescribeUser\",\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:identitystore::368945481389:identitystore/*\",\"arn:aws:identitystore:::user/*\"],\"Sid\":\"AllowDevOpsAgentIDCUserAccess\"}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  lifecycle {
    ignore_changes = all
  }
}
