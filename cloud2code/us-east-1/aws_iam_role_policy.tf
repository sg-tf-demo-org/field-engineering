resource "aws_iam_role_policy" "aiden_checkout_role_dev_checkoutaccess" {
  name = "CheckoutAccess"
  role = "aiden-checkout-role-dev"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"sqs:SendMessage\",\"sqs:ReceiveMessage\",\"sqs:DeleteMessage\",\"sqs:GetQueueAttributes\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:sqs:us-east-1:697091778198:aiden-checkout-orders-dev\",\"arn:aws:sqs:us-east-1:697091778198:aiden-checkout-dlq-dev\"]},{\"Action\":[\"dynamodb:GetItem\",\"dynamodb:PutItem\",\"dynamodb:UpdateItem\",\"dynamodb:Query\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:dynamodb:us-east-1:697091778198:table/aiden-checkout-orders-dev\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "aiden_xc7sh_master_role_aiden_xc7sh_master_policy" {
  name = "aiden-xc7sh-master-policy"
  role = "aiden-xc7sh-master-role"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:AttachVolume\",\"ec2:AuthorizeSecurityGroupIngress\",\"ec2:CreateSecurityGroup\",\"ec2:CreateTags\",\"ec2:CreateVolume\",\"ec2:DeleteSecurityGroup\",\"ec2:DeleteVolume\",\"ec2:Describe*\",\"ec2:DetachVolume\",\"ec2:ModifyInstanceAttribute\",\"ec2:ModifyVolume\",\"ec2:RevokeSecurityGroupIngress\",\"elasticloadbalancing:AddTags\",\"elasticloadbalancing:AttachLoadBalancerToSubnets\",\"elasticloadbalancing:ApplySecurityGroupsToLoadBalancer\",\"elasticloadbalancing:CreateListener\",\"elasticloadbalancing:CreateLoadBalancer\",\"elasticloadbalancing:CreateLoadBalancerPolicy\",\"elasticloadbalancing:CreateLoadBalancerListeners\",\"elasticloadbalancing:CreateTargetGroup\",\"elasticloadbalancing:ConfigureHealthCheck\",\"elasticloadbalancing:DeleteListener\",\"elasticloadbalancing:DeleteLoadBalancer\",\"elasticloadbalancing:DeleteLoadBalancerListeners\",\"elasticloadbalancing:DeleteTargetGroup\",\"elasticloadbalancing:DeregisterInstancesFromLoadBalancer\",\"elasticloadbalancing:DeregisterTargets\",\"elasticloadbalancing:Describe*\",\"elasticloadbalancing:DetachLoadBalancerFromSubnets\",\"elasticloadbalancing:ModifyListener\",\"elasticloadbalancing:ModifyLoadBalancerAttributes\",\"elasticloadbalancing:ModifyTargetGroup\",\"elasticloadbalancing:ModifyTargetGroupAttributes\",\"elasticloadbalancing:RegisterInstancesWithLoadBalancer\",\"elasticloadbalancing:RegisterTargets\",\"elasticloadbalancing:SetLoadBalancerPoliciesForBackendServer\",\"elasticloadbalancing:SetLoadBalancerPoliciesOfListener\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "aiden_xc7sh_worker_role_aiden_xc7sh_worker_policy" {
  name = "aiden-xc7sh-worker-policy"
  role = "aiden-xc7sh-worker-role"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:DescribeInstances\",\"ec2:DescribeRegions\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "cicd_overwatch_jenkins_ssm_cicd_overwatch_ecr_push_pull" {
  name = "cicd-overwatch-ecr-push-pull"
  role = "cicd-overwatch-jenkins-ssm"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"ecr:GetAuthorizationToken\",\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AllowEcrAuthorization\"},{\"Action\":[\"ecr:UploadLayerPart\",\"ecr:StartImageScan\",\"ecr:PutImage\",\"ecr:InitiateLayerUpload\",\"ecr:GetDownloadUrlForLayer\",\"ecr:DescribeImages\",\"ecr:DescribeImageScanFindings\",\"ecr:CompleteLayerUpload\",\"ecr:BatchGetImage\",\"ecr:BatchCheckLayerAvailability\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ecr:us-west-2:697091778198:repository/cicd-overwatch-demo-app\",\"Sid\":\"AllowDemoRepositoryPushPull\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "cicd_overwatch_jenkins_ssm_cicd_overwatch_linear_api_key_read" {
  name = "cicd-overwatch-linear-api-key-read"
  role = "cicd-overwatch-jenkins-ssm"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"ssm:GetParameter\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:us-west-2:697091778198:parameter/cicd-overwatch/linear/api-key\",\"Sid\":\"AllowLinearApiKeyRead\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "dev_fe_infra_otel_demo_deploy_dev_fe_infra_otel_demo_deploy_policy" {
  name = "dev-fe-infra-otel-demo-deploy-policy"
  role = "dev-fe-infra-otel-demo-deploy"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ssm:GetParameters\",\"ssm:GetParameter\",\"s3:*\",\"logs:*\",\"kms:*\",\"elasticloadbalancing:*\",\"eks:*\",\"ec2:*\",\"dynamodb:*\",\"cloudwatch:*\",\"autoscaling:*\"],\"Condition\":{\"StringEquals\":{\"aws:RequestedRegion\":\"us-east-1\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"InfraServices\"},{\"Action\":[\"iam:UntagRole\",\"iam:TagRole\",\"iam:TagOpenIDConnectProvider\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:PutRolePolicy\",\"iam:PassRole\",\"iam:ListRolePolicies\",\"iam:ListInstanceProfilesForRole\",\"iam:ListAttachedRolePolicies\",\"iam:GetRolePolicy\",\"iam:GetRole\",\"iam:GetOpenIDConnectProvider\",\"iam:GetInstanceProfile\",\"iam:DetachRolePolicy\",\"iam:DeleteRolePolicy\",\"iam:DeleteRole\",\"iam:DeleteInstanceProfile\",\"iam:CreateServiceLinkedRole\",\"iam:CreateRole\",\"iam:CreateOpenIDConnectProvider\",\"iam:CreateInstanceProfile\",\"iam:AttachRolePolicy\",\"iam:AddRoleToInstanceProfile\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"IamForClusterAndRoles\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "field_engineering_drift_monitor_formatterrole_5wfcktgjlmtx_logs" {
  name = "logs"
  role = "field-engineering-drift-monitor-FormatterRole-5WFcKtGjlMTX"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\",\"logs:CreateLogStream\",\"logs:PutLogEvents\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/lambda/fe-drift-formatter*\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "prod_fe_infra_otel_demo_deploy_prod_fe_infra_otel_demo_deploy_policy" {
  name = "prod-fe-infra-otel-demo-deploy-policy"
  role = "prod-fe-infra-otel-demo-deploy"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ssm:GetParameters\",\"ssm:GetParameter\",\"s3:*\",\"logs:*\",\"kms:*\",\"elasticloadbalancing:*\",\"eks:*\",\"ec2:*\",\"dynamodb:*\",\"cloudwatch:*\",\"autoscaling:*\"],\"Condition\":{\"StringEquals\":{\"aws:RequestedRegion\":\"us-east-1\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"InfraServices\"},{\"Action\":[\"iam:UntagRole\",\"iam:TagRole\",\"iam:TagOpenIDConnectProvider\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:PutRolePolicy\",\"iam:PassRole\",\"iam:ListRolePolicies\",\"iam:ListInstanceProfilesForRole\",\"iam:ListAttachedRolePolicies\",\"iam:GetRolePolicy\",\"iam:GetRole\",\"iam:GetOpenIDConnectProvider\",\"iam:GetInstanceProfile\",\"iam:DetachRolePolicy\",\"iam:DeleteRolePolicy\",\"iam:DeleteRole\",\"iam:DeleteInstanceProfile\",\"iam:CreateServiceLinkedRole\",\"iam:CreateRole\",\"iam:CreateOpenIDConnectProvider\",\"iam:CreateInstanceProfile\",\"iam:AttachRolePolicy\",\"iam:AddRoleToInstanceProfile\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"IamForClusterAndRoles\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "stackgen_aiden2_role_tag_sessions" {
  name = "tag-sessions"
  role = "stackgen-aiden2-role"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"VisualEditor0\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "stackgen_bastion_fss_assume_scan_targets" {
  name = "assume-scan-targets"
  role = "stackgen-bastion-fss"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::697091778198:role/stackgen-scan-*\",\"Sid\":\"AssumeScanTargetRoles\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "stackgen_vault_fss_assume_stackgen_bastion_fss" {
  name = "assume-stackgen-bastion-fss"
  role = "stackgen-vault-fss"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::697091778198:role/stackgen-bastion-fss\",\"Sid\":\"AssumeStackgenBastion\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "stage_fe_infra_otel_demo_deploy_stage_fe_infra_otel_demo_deploy_policy" {
  name = "stage-fe-infra-otel-demo-deploy-policy"
  role = "stage-fe-infra-otel-demo-deploy"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ssm:GetParameters\",\"ssm:GetParameter\",\"s3:*\",\"logs:*\",\"kms:*\",\"elasticloadbalancing:*\",\"eks:*\",\"ec2:*\",\"dynamodb:*\",\"cloudwatch:*\",\"autoscaling:*\"],\"Condition\":{\"StringEquals\":{\"aws:RequestedRegion\":\"us-east-1\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"InfraServices\"},{\"Action\":[\"iam:UntagRole\",\"iam:TagRole\",\"iam:TagOpenIDConnectProvider\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:PutRolePolicy\",\"iam:PassRole\",\"iam:ListRolePolicies\",\"iam:ListInstanceProfilesForRole\",\"iam:ListAttachedRolePolicies\",\"iam:GetRolePolicy\",\"iam:GetRole\",\"iam:GetOpenIDConnectProvider\",\"iam:GetInstanceProfile\",\"iam:DetachRolePolicy\",\"iam:DeleteRolePolicy\",\"iam:DeleteRole\",\"iam:DeleteInstanceProfile\",\"iam:CreateServiceLinkedRole\",\"iam:CreateRole\",\"iam:CreateOpenIDConnectProvider\",\"iam:CreateInstanceProfile\",\"iam:AttachRolePolicy\",\"iam:AddRoleToInstanceProfile\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"IamForClusterAndRoles\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy" "vpcflowlogsrole_vpcflowlogspolicy" {
  name = "VPCFlowLogsPolicy"
  role = "VPCFlowLogsRole"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\",\"logs:CreateLogStream\",\"logs:PutLogEvents\",\"logs:DescribeLogGroups\",\"logs:DescribeLogStreams\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-east-1:697091778198:log-group:/aws/vpc/field-engineering:*\"}]}"
  lifecycle {
    ignore_changes = all
  }
}
