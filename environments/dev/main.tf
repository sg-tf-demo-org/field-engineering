##############################################################################
# Environment stack: replicates the live field-engineering EKS Auto Mode setup
# in a dedicated VPC, plus a free-tier demo workload, the self-hosted runner,
# and the GitHub OIDC provider + per-env deploy role.
##############################################################################

locals {
  name_prefix = "${var.env_prefix}-${var.base_name}"

  tags = {
    Owner       = var.owner
    CostCenter  = var.cost_center
    Environment = var.environment
    Project     = var.base_name
  }
}

module "networking" {
  source = "../../modules/networking"

  name_prefix = local.name_prefix
  vpc_cidr    = var.vpc_cidr
  azs         = var.azs
  tags        = local.tags
}

module "eks" {
  source = "../../modules/eks"

  name_prefix     = local.name_prefix
  cluster_version = var.cluster_version
  vpc_id          = module.networking.vpc_id
  subnet_ids      = module.networking.private_subnet_ids
  tags            = local.tags
}

module "compute" {
  source = "../../modules/compute-ec2"

  name_prefix = local.name_prefix
  vpc_id      = module.networking.vpc_id
  subnet_id   = module.networking.private_subnet_ids[0]
  tags        = local.tags
}

module "runner" {
  source = "../../modules/runner"

  name_prefix               = local.name_prefix
  vpc_id                    = module.networking.vpc_id
  subnet_id                 = module.networking.private_subnet_ids[0]
  runner_registration_token = var.runner_registration_token
  tags                      = local.tags
}

module "github_oidc" {
  source = "../../modules/github-oidc"

  name_prefix          = local.name_prefix
  environment          = var.environment
  create_oidc_provider = var.create_oidc_provider
  tags                 = local.tags
}

module "s3_cmk" {
  source = "../../modules/s3-cmk"

  bucket_name = "${local.name_prefix}-demo-data"

  tags = merge(local.tags, {
    Owner       = "platform"
    CostCenter  = "FE-DEMO"
    Environment = "dev"
  })
}
