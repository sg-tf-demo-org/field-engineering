resource "aws_iam_role" "ai_sre_demo_ebs_csi_driver" {
  name = "ai-sre-demo-ebs-csi-driver"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/3B526AA4B8ABDA36E8341C97B2C425F5:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/3B526AA4B8ABDA36E8341C97B2C425F5:sub\":\"system:serviceaccount:kube-system:ebs-csi-controller-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::697091778198:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/3B526AA4B8ABDA36E8341C97B2C425F5\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
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

resource "aws_iam_role" "ai_sre_demo_eks_cluster" {
  name = "ai-sre-demo-eks-cluster"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
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

resource "aws_iam_role" "ai_sre_demo_eks_nodes" {
  name = "ai-sre-demo-eks-nodes"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
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

resource "aws_iam_role" "ai_sre_demo_github_actions_deploy" {
  name = "ai-sre-demo-github-actions-deploy"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"token.actions.githubusercontent.com:aud\":\"sts.amazonaws.com\"},\"StringLike\":{\"token.actions.githubusercontent.com:sub\":\"repo:stackgen-demo/AI-SRE-demo-environment:*\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::697091778198:oidc-provider/token.actions.githubusercontent.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
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

resource "aws_iam_role" "ai_sre_demo_release_orchestrator" {
  name = "ai-sre-demo-release-orchestrator"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
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

resource "aws_iam_role" "aiden2_role" {
  name = "aiden2-role"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"rr1ryTrN6X\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"}},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "aiden_checkout_role_dev" {
  name = "aiden-checkout-role-dev"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"ecs-tasks.amazonaws.com\",\"ec2.amazonaws.com\"]}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    AppStack = "checkout"
    CostCenter = "FE-DEMO"
    Environment = "dev"
    ManagedBy = "aiden"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "aiden_infra_aws_assume_role" {
  name = "aiden-infra-aws-assume-role"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"B9P95HJFOC\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"},\"Sid\":\"AllowStackgenBastionAssumeRoleWithExternalId\"},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"},\"Sid\":\"AllowStackgenBastionTagSession\"},{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::205376326832:role/prod-aiden-pod-role\"},\"Sid\":\"AllowProdAidenPodRoleAssumeRoleAndTagSession\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "aiden_xc7sh_master_role" {
  name = "aiden-xc7sh-master-role"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "aiden_xc7sh_worker_role" {
  name = "aiden-xc7sh-worker-role"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "amazoneksautoclusterrole" {
  name = "AmazonEKSAutoClusterRole"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "amazoneksautonoderole" {
  name = "AmazonEKSAutoNodeRole"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "apprunnerecraccessrole_data_recipes" {
  name = "AppRunnerECRAccessRole-data-recipes"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"tasks.apprunner.amazonaws.com\",\"build.apprunner.amazonaws.com\"]}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsreservedsso_administratoraccess_bebcf97aa8880249" {
  name = "AWSReservedSSO_AdministratorAccess_bebcf97aa8880249"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRoleWithSAML\",\"sts:TagSession\"],\"Condition\":{\"StringEquals\":{\"SAML:aud\":\"https://signin.aws.amazon.com/saml\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::697091778198:saml-provider/AWSSSO_47a9b82391364805_DO_NOT_DELETE\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-reserved/sso.amazonaws.com/"
  max_session_duration = 43200
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforaidevops" {
  name = "AWSServiceRoleForAIDevOps"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/aidevops.amazonaws.com/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforamazoneks" {
  name = "AWSServiceRoleForAmazonEKS"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/eks.amazonaws.com/"
  description = "Allows Amazon EKS to call AWS services on your behalf."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforamazoneksnodegroup" {
  name = "AWSServiceRoleForAmazonEKSNodegroup"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks-nodegroup.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/eks-nodegroup.amazonaws.com/"
  description = "This policy allows Amazon EKS to create and manage Nodegroups"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforapprunner" {
  name = "AWSServiceRoleForAppRunner"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"apprunner.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/apprunner.amazonaws.com/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforapprunnernetworking" {
  name = "AWSServiceRoleForAppRunnerNetworking"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"networking.apprunner.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/networking.apprunner.amazonaws.com/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforautoscaling" {
  name = "AWSServiceRoleForAutoScaling"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"autoscaling.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/autoscaling.amazonaws.com/"
  description = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforawslicensemanagerrole" {
  name = "AWSServiceRoleForAWSLicenseManagerRole"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"license-manager.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/license-manager.amazonaws.com/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforclientvpn" {
  name = "AWSServiceRoleForClientVPN"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"clientvpn.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/clientvpn.amazonaws.com/"
  description = "Service Linked Role for Client VPN"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforcloudformationstacksetsorgmember" {
  name = "AWSServiceRoleForCloudFormationStackSetsOrgMember"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"member.org.stacksets.cloudformation.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/member.org.stacksets.cloudformation.amazonaws.com/"
  description = "Service linked role for CloudFormation StackSets (Organization Member)"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforecs" {
  name = "AWSServiceRoleForECS"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/ecs.amazonaws.com/"
  description = "Policy to enable Amazon ECS to manage your EC2 instances and related resources."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforelasticloadbalancing" {
  name = "AWSServiceRoleForElasticLoadBalancing"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"elasticloadbalancing.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/elasticloadbalancing.amazonaws.com/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleformarketplacelicensemanagement" {
  name = "AWSServiceRoleForMarketplaceLicenseManagement"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"license-management.marketplace.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/license-management.marketplace.amazonaws.com/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsservicerolefororganizations" {
  name = "AWSServiceRoleForOrganizations"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"organizations.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/organizations.amazonaws.com/"
  description = "Service-linked role used by AWS Organizations to enable integration of other AWS services with Organizations."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforresourceexplorer" {
  name = "AWSServiceRoleForResourceExplorer"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"resource-explorer-2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/resource-explorer-2.amazonaws.com/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforsso" {
  name = "AWSServiceRoleForSSO"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"sso.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/sso.amazonaws.com/"
  description = "Service-linked role used by AWS SSO to manage AWS resources, including IAM roles, policies and SAML IdP on your behalf."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsserviceroleforsupport" {
  name = "AWSServiceRoleForSupport"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"support.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/support.amazonaws.com/"
  description = "Enables resource access for AWS to provide billing, administrative and support services"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "awsservicerolefortrustedadvisor" {
  name = "AWSServiceRoleForTrustedAdvisor"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"trustedadvisor.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/aws-service-role/trustedadvisor.amazonaws.com/"
  description = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "cicd_overwatch_jenkins_ssm" {
  name = "cicd-overwatch-jenkins-ssm"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    Environment = "demo"
    ManagedBy = "terraform"
    Project = "CICD-Overwatch"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "dev_fe_infra_otel_demo_deploy" {
  name = "dev-fe-infra-otel-demo-deploy"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRoleWithWebIdentity\",\"sts:TagSession\"],\"Condition\":{\"StringEquals\":{\"token.actions.githubusercontent.com:aud\":\"sts.amazonaws.com\"},\"StringLike\":{\"token.actions.githubusercontent.com:sub\":[\"repo:sg-tf-demo-org@*/field-engineering@*:*\",\"repo:sg-tf-demo-org/field-engineering:*\"]}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::697091778198:oidc-provider/token.actions.githubusercontent.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    CostCenter = "field-eng-demo"
    Environment = "dev"
    ManagedBy = "terraform"
    Name = "dev-fe-infra-otel-demo-deploy"
    Owner = "field-engineering"
    Project = "fe-infra-otel-demo"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "devopsagentrole_agentspace_2w7uapbh" {
  name = "DevOpsAgentRole-AgentSpace-2w7uapbh"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"ArnLike\":{\"aws:SourceArn\":\"arn:aws:aidevops:us-east-1:697091778198:agentspace/*\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  description = "A service-linked role required for AWS DevOps Agent to access your resources."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "devopsagentrole_agentspace_eud89akz" {
  name = "DevOpsAgentRole-AgentSpace-eud89akz"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"ArnLike\":{\"aws:SourceArn\":\"arn:aws:aidevops:us-west-2:697091778198:agentspace/*\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  description = "A service-linked role required for AWS DevOps Agent to access your resources."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "devopsagentrole_agentspace_gr4t2wl7" {
  name = "DevOpsAgentRole-AgentSpace-gr4t2wl7"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"ArnLike\":{\"aws:SourceArn\":\"arn:aws:aidevops:us-east-1:697091778198:agentspace/*\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  description = "A service-linked role required for AWS DevOps Agent to access your resources."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "devopsagentrole_webappadmin_2hb4cyst" {
  name = "DevOpsAgentRole-WebappAdmin-2hb4cyst"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Condition\":{\"ArnEquals\":{\"aws:SourceArn\":\"arn:aws:aidevops:us-east-1:697091778198:agentspace/f076687b-74e0-4099-a203-93866aa0dad4\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  description = "A service-linked role required for AWS DevOps Agent to enable the off-console web app."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "devopsagentrole_webappadmin_l7itpvyk" {
  name = "DevOpsAgentRole-WebappAdmin-l7itpvyk"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Condition\":{\"ArnEquals\":{\"aws:SourceArn\":\"arn:aws:aidevops:us-west-2:697091778198:agentspace/5ac278ef-da36-447b-8af1-06973bfcaa13\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  description = "A service-linked role required for AWS DevOps Agent to enable the off-console web app."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "devopsagentrole_webappadmin_r2om0d3u" {
  name = "DevOpsAgentRole-WebappAdmin-r2om0d3u"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Condition\":{\"ArnEquals\":{\"aws:SourceArn\":\"arn:aws:aidevops:us-east-1:697091778198:agentspace/7716b24f-4e78-4f93-a258-e9574eef50c0\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  description = "A service-linked role required for AWS DevOps Agent to enable the off-console web app."
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "devopsagentrole_webappidc_z6n4zzsh" {
  name = "DevOpsAgentRole-WebappIDC-z6n4zzsh"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Condition\":{\"ArnEquals\":{\"aws:SourceArn\":\"arn:aws:aidevops:us-east-1:697091778198:agentspace/7716b24f-4e78-4f93-a258-e9574eef50c0\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"}},{\"Action\":\"sts:SetContext\",\"Condition\":{\"ArnEquals\":{\"aws:SourceArn\":\"arn:aws:aidevops:us-east-1:697091778198:agentspace/7716b24f-4e78-4f93-a258-e9574eef50c0\"},\"ForAllValues:ArnEquals\":{\"sts:RequestContextProviders\":\"arn:aws:iam::aws:contextProvider/IdentityCenter\"},\"Null\":{\"sts:RequestContextProviders\":\"false\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aidevops.amazonaws.com\"},\"Sid\":\"TrustedIdentityPropagation\"}],\"Version\":\"2012-10-17\"}"
  path = "/service-role/"
  description = "A service-linked role required for AWS DevOps Agent to enable the off-console web app login with IAM Identity Center"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "ecsinfrastructureroleforexpressservices" {
  name = "ecsInfrastructureRoleForExpressServices"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs.amazonaws.com\"},\"Sid\":\"AllowAccessToECSForInfrastructureManagement\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "ecstaskexecutionrole" {
  name = "ecsTaskExecutionRole"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"ArnLike\":{\"aws:SourceArn\":\"arn:aws:ecs:us-east-2:697091778198:*\"},\"StringEquals\":{\"aws:SourceAccount\":\"697091778198\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs-tasks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "externaldnsrole" {
  name = "ExternalDNSRole"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/472DC0376B7484FDDB3A5D666717823D:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-east-1.amazonaws.com/id/472DC0376B7484FDDB3A5D666717823D:sub\":\"system:serviceaccount:external-dns:external-dns\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::697091778198:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/472DC0376B7484FDDB3A5D666717823D\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "fde_demo_sachin" {
  name = "FDE-Demo-sachin"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"Be7bNVPQSU\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"}},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  description = "Testing the stackgenCOre demo"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "field_engineering_drift_monitor_formatterrole_5wfcktgjlmtx" {
  name = "field-engineering-drift-monitor-FormatterRole-5WFcKtGjlMTX"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    CostCenter = "FE-DEMO"
    Environment = "dev"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "organizationaccountaccessrole" {
  name = "OrganizationAccountAccessRole"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::368945481389:root\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "prod_fe_infra_otel_demo_deploy" {
  name = "prod-fe-infra-otel-demo-deploy"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRoleWithWebIdentity\",\"sts:TagSession\"],\"Condition\":{\"StringEquals\":{\"token.actions.githubusercontent.com:aud\":\"sts.amazonaws.com\"},\"StringLike\":{\"token.actions.githubusercontent.com:sub\":[\"repo:sg-tf-demo-org@*/field-engineering@*:*\",\"repo:sg-tf-demo-org/field-engineering:*\"]}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::697091778198:oidc-provider/token.actions.githubusercontent.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  description = "GitHub Actions OIDC deploy role for prod (fe-infra-otel-demo)"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    CostCenter = "FE-DEMO"
    Environment = "prod"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "stackgen_aiden2_role" {
  name = "stackgen-aiden2-role"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"PeZ8dXoCRh\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"},\"Sid\":\"AllowStackGenAssumeRole\"},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"},\"Sid\":\"AllowStackGenTagSession\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "stackgen_aiden_readonly" {
  name = "stackgen-aiden-readonly"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"LbPYMZJ28X\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"},\"Sid\":\"AllowStackGenAssumeRole\"},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"},\"Sid\":\"AllowStackGenTagSession\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
  description = "Read-only access for Aiden 2.0 / StackGen (field-engineering)"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    CostCenter = "FE-DEMO"
    Environment = "dev"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "stackgen_aws_integration" {
  name = "stackgen-aws-integration"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"bxqz0d5fgb\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"}},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::239541129941:role/stackgen-bastion\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "stackgen_bastion_fss" {
  name = "stackgen-bastion-fss"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"fss-stackgen-vault\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::697091778198:role/stackgen-vault-fss\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  description = "StackGen vault bastion/broker role; assumed by stackgen-vault-fss, assumes stackgen-scan-*"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "stackgen_vault_fss" {
  name = "stackgen-vault-fss"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/3B526AA4B8ABDA36E8341C97B2C425F5:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/3B526AA4B8ABDA36E8341C97B2C425F5:sub\":\"system:serviceaccount:fss-stackgen:stackgen-vault\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::697091778198:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/3B526AA4B8ABDA36E8341C97B2C425F5\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  description = "StackGen vault pod IRSA role; assumes stackgen-bastion-fss for AWS scanning"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "stacksets_exec_f0c8fb48f39560f7383d5fc6d3582666" {
  name = "stacksets-exec-f0c8fb48f39560f7383d5fc6d3582666"
  assume_role_policy = "{\"Id\":\"stacksets-exec-f0c8fb48f39560f7383d5fc6d3582666-assume-role-policy\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::368945481389:role/aws-service-role/stacksets.cloudformation.amazonaws.com/AWSServiceRoleForCloudFormationStackSetsOrgAdmin\"},\"Sid\":\"1\"}],\"Version\":\"2012-10-17\"}"
  path = "/"
  description = "Role created by AWSCloudFormation StackSets"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "stage_fe_infra_otel_demo_deploy" {
  name = "stage-fe-infra-otel-demo-deploy"
  assume_role_policy = "{\"Statement\":[{\"Action\":[\"sts:AssumeRoleWithWebIdentity\",\"sts:TagSession\"],\"Condition\":{\"StringEquals\":{\"token.actions.githubusercontent.com:aud\":\"sts.amazonaws.com\"},\"StringLike\":{\"token.actions.githubusercontent.com:sub\":[\"repo:sg-tf-demo-org@*/field-engineering@*:*\",\"repo:sg-tf-demo-org/field-engineering:*\"]}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::697091778198:oidc-provider/token.actions.githubusercontent.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  description = "GitHub Actions OIDC deploy role for stage (fe-infra-otel-demo)"
  max_session_duration = 3600
  force_detach_policies = false
  tags = {
    CostCenter = "FE-DEMO"
    Environment = "stage"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "terraform_testing_ssm_role" {
  name = "terraform-testing-ssm-role"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role" "vpcflowlogsrole" {
  name = "VPCFlowLogsRole"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"vpc-flow-logs.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  path = "/"
  max_session_duration = 3600
  force_detach_policies = false
  lifecycle {
    ignore_changes = all
  }
}
