resource "aws_iam_user" "aiden2" {
  name = "aiden2"
  path = "/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user" "aiden_xc7sh_aws_ebs_csi_driver_operator_vmjss" {
  name = "aiden-xc7sh-aws-ebs-csi-driver-operator-vmjss"
  path = "/"
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user" "aiden_xc7sh_cloud_credential_operator_iam_ro_fp4d2" {
  name = "aiden-xc7sh-cloud-credential-operator-iam-ro-fp4d2"
  path = "/"
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user" "aiden_xc7sh_openshift_cloud_network_config_contro_jn6wh" {
  name = "aiden-xc7sh-openshift-cloud-network-config-contro-jn6wh"
  path = "/"
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user" "aiden_xc7sh_openshift_image_registry_gkh4d" {
  name = "aiden-xc7sh-openshift-image-registry-gkh4d"
  path = "/"
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user" "aiden_xc7sh_openshift_ingress_5f7zv" {
  name = "aiden-xc7sh-openshift-ingress-5f7zv"
  path = "/"
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user" "aiden_xc7sh_openshift_machine_api_aws_cmxr5" {
  name = "aiden-xc7sh-openshift-machine-api-aws-cmxr5"
  path = "/"
  tags = {
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user" "grafana_cloudwatch_eks" {
  name = "grafana-cloudwatch-eks"
  path = "/"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_user" "ocp_ipi_aiden_sno_installer" {
  name = "ocp-ipi-aiden-sno-installer"
  path = "/"
  tags = {
    CreatedBy = "codex"
    Purpose = "ocp-ipi-aiden-sno"
  }
  lifecycle {
    ignore_changes = all
  }
}
