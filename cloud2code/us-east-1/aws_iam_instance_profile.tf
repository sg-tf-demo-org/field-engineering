resource "aws_iam_instance_profile" "ai_sre_demo_release_orchestrator" {
  name = "ai-sre-demo-release-orchestrator"
  role = "ai-sre-demo-release-orchestrator"
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

resource "aws_iam_instance_profile" "aiden_xc7sh_master_profile" {
  name = "aiden-xc7sh-master-profile"
  role = "aiden-xc7sh-master-role"
  path = "/"
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_instance_profile" "aiden_xc7sh_worker_profile" {
  name = "aiden-xc7sh-worker-profile"
  role = "aiden-xc7sh-worker-role"
  path = "/"
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_instance_profile" "cicd_overwatch_jenkins" {
  name = "cicd-overwatch-jenkins"
  role = "cicd-overwatch-jenkins-ssm"
  path = "/"
  tags = {
    Environment = "demo"
    ManagedBy = "terraform"
    Project = "CICD-Overwatch"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_instance_profile" "eks_84cf45db_d4eb_00a5_6f16_29cdade15466" {
  name = "eks-84cf45db-d4eb-00a5-6f16-29cdade15466"
  role = "ai-sre-demo-eks-nodes"
  path = "/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_instance_profile" "eks_us_east_1_field_engineering_1093326807228428974" {
  name = "eks-us-east-1-field-engineering-1093326807228428974"
  role = "AmazonEKSAutoNodeRole"
  path = "/eks/us-east-1/field-engineering/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_instance_profile" "terraform_testing_ssm_profile" {
  name = "terraform-testing-ssm-profile"
  role = "terraform-testing-ssm-role"
  path = "/"
  lifecycle {
    ignore_changes = all
  }
}
