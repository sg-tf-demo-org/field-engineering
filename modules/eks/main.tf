##############################################################################
# EKS Auto Mode cluster (mirrors the live field-engineering cluster):
#   - version 1.36, Auto Mode with general-purpose + system node pools
#   - authentication mode API, service CIDR 10.100.0.0/16
#   - metrics-server addon, secrets envelope-encrypted with a CMK (module-created)
#   - private endpoint by default (governance-clean; no public 0.0.0.0/0 access)
##############################################################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "${var.name_prefix}-eks"
  cluster_version = var.cluster_version

  # EKS Auto Mode: AWS manages compute for the given built-in node pools.
  cluster_compute_config = {
    enabled    = true
    node_pools = var.node_pools
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  authentication_mode                      = "API"
  enable_cluster_creator_admin_permissions = true

  cluster_endpoint_public_access       = var.endpoint_public_access
  cluster_endpoint_private_access      = true
  cluster_endpoint_public_access_cidrs = var.public_access_cidrs

  # Match the live cluster service CIDR.
  cluster_service_ipv4_cidr = "10.100.0.0/16"

  # Envelope-encrypt secrets with a customer-managed KMS key (rotation enabled
  # by the module) — satisfies the EKS-CMK governance rule.
  create_kms_key = true
  cluster_encryption_config = {
    resources = ["secrets"]
  }
  kms_key_enable_default_policy = true

  # metrics-server as an EKS-managed add-on (live cluster parity).
  cluster_addons = {
    metrics-server = {
      most_recent = true
    }
  }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-eks"
  })
}
