resource "aws_iam_user_policy" "aiden_xc7sh_aws_ebs_csi_driver_operator_vmjss_aiden_xc7sh_aws_ebs_csi_driver_operator_vmjss_policy" {
  name = "aiden-xc7sh-aws-ebs-csi-driver-operator-vmjss-policy"
  user = "aiden-xc7sh-aws-ebs-csi-driver-operator-vmjss"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:AttachVolume\",\"ec2:CreateSnapshot\",\"ec2:CreateTags\",\"ec2:CreateVolume\",\"ec2:DeleteSnapshot\",\"ec2:DeleteTags\",\"ec2:DeleteVolume\",\"ec2:DescribeInstances\",\"ec2:DescribeSnapshots\",\"ec2:DescribeTags\",\"ec2:DescribeVolumes\",\"ec2:DescribeVolumesModifications\",\"ec2:DetachVolume\",\"ec2:ModifyVolume\",\"ec2:DescribeAvailabilityZones\",\"ec2:EnableFastSnapshotRestores\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"kms:ReEncrypt*\",\"kms:Decrypt\",\"kms:Encrypt\",\"kms:GenerateDataKey\",\"kms:GenerateDataKeyWithoutPlainText\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"kms:RevokeGrant\",\"kms:CreateGrant\",\"kms:ListGrants\"],\"Condition\":{\"Bool\":{\"kms:GrantIsForAWSResource\":true}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"iam:GetUser\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::697091778198:user/aiden-xc7sh-aws-ebs-csi-driver-operator-vmjss\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user_policy" "aiden_xc7sh_cloud_credential_operator_iam_ro_fp4d2_aiden_xc7sh_cloud_credential_operator_iam_ro_fp4d2_policy" {
  name = "aiden-xc7sh-cloud-credential-operator-iam-ro-fp4d2-policy"
  user = "aiden-xc7sh-cloud-credential-operator-iam-ro-fp4d2"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:GetUser\",\"iam:GetUserPolicy\",\"iam:ListAccessKeys\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"iam:GetUser\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::697091778198:user/aiden-xc7sh-cloud-credential-operator-iam-ro-fp4d2\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user_policy" "aiden_xc7sh_openshift_cloud_network_config_contro_jn6wh_aiden_xc7sh_openshift_cloud_network_config_contro_jn6wh_policy" {
  name = "aiden-xc7sh-openshift-cloud-network-config-contro-jn6wh-policy"
  user = "aiden-xc7sh-openshift-cloud-network-config-contro-jn6wh"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:DescribeInstances\",\"ec2:DescribeInstanceStatus\",\"ec2:DescribeInstanceTypes\",\"ec2:UnassignPrivateIpAddresses\",\"ec2:AssignPrivateIpAddresses\",\"ec2:UnassignIpv6Addresses\",\"ec2:AssignIpv6Addresses\",\"ec2:DescribeSubnets\",\"ec2:DescribeNetworkInterfaces\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"iam:GetUser\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::697091778198:user/aiden-xc7sh-openshift-cloud-network-config-contro-jn6wh\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user_policy" "aiden_xc7sh_openshift_image_registry_gkh4d_aiden_xc7sh_openshift_image_registry_gkh4d_policy" {
  name = "aiden-xc7sh-openshift-image-registry-gkh4d-policy"
  user = "aiden-xc7sh-openshift-image-registry-gkh4d"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:CreateBucket\",\"s3:DeleteBucket\",\"s3:PutBucketTagging\",\"s3:GetBucketTagging\",\"s3:PutBucketPublicAccessBlock\",\"s3:GetBucketPublicAccessBlock\",\"s3:PutEncryptionConfiguration\",\"s3:GetEncryptionConfiguration\",\"s3:PutLifecycleConfiguration\",\"s3:GetLifecycleConfiguration\",\"s3:GetBucketLocation\",\"s3:ListBucket\",\"s3:GetObject\",\"s3:PutObject\",\"s3:DeleteObject\",\"s3:ListBucketMultipartUploads\",\"s3:AbortMultipartUpload\",\"s3:ListMultipartUploadParts\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"iam:GetUser\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::697091778198:user/aiden-xc7sh-openshift-image-registry-gkh4d\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user_policy" "aiden_xc7sh_openshift_ingress_5f7zv_aiden_xc7sh_openshift_ingress_5f7zv_policy" {
  name = "aiden-xc7sh-openshift-ingress-5f7zv-policy"
  user = "aiden-xc7sh-openshift-ingress-5f7zv"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"elasticloadbalancing:DescribeLoadBalancers\",\"route53:ListHostedZones\",\"route53:ListTagsForResources\",\"route53:ChangeResourceRecordSets\",\"tag:GetResources\",\"sts:AssumeRole\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"iam:GetUser\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::697091778198:user/aiden-xc7sh-openshift-ingress-5f7zv\"}]}"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user_policy" "aiden_xc7sh_openshift_machine_api_aws_cmxr5_aiden_xc7sh_openshift_machine_api_aws_cmxr5_policy" {
  name = "aiden-xc7sh-openshift-machine-api-aws-cmxr5-policy"
  user = "aiden-xc7sh-openshift-machine-api-aws-cmxr5"
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:CreateTags\",\"ec2:DescribeAvailabilityZones\",\"ec2:DescribeDhcpOptions\",\"ec2:DescribeImages\",\"ec2:DescribeInstances\",\"ec2:DescribeInstanceTypes\",\"ec2:DescribeInternetGateways\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeRegions\",\"ec2:DescribeSubnets\",\"ec2:DescribeVpcs\",\"ec2:RunInstances\",\"ec2:TerminateInstances\",\"elasticloadbalancing:DescribeLoadBalancers\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetHealth\",\"elasticloadbalancing:RegisterInstancesWithLoadBalancer\",\"elasticloadbalancing:RegisterTargets\",\"elasticloadbalancing:DeregisterTargets\",\"iam:PassRole\",\"iam:CreateServiceLinkedRole\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"kms:ReEncrypt*\",\"kms:Decrypt\",\"kms:Encrypt\",\"kms:GenerateDataKey\",\"kms:GenerateDataKeyWithoutPlainText\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"kms:RevokeGrant\",\"kms:CreateGrant\",\"kms:ListGrants\"],\"Condition\":{\"Bool\":{\"kms:GrantIsForAWSResource\":true}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"iam:GetUser\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::697091778198:user/aiden-xc7sh-openshift-machine-api-aws-cmxr5\"}]}"
  lifecycle {
    ignore_changes = all
  }
}
