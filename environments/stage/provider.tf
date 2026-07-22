terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region

  # Fleet-wide mandatory tags. Surfaced as tags_all on every resource in the
  # plan and enforced by governance/policies/tf/tags.rego.
  default_tags {
    tags = {
      Owner       = var.owner
      CostCenter  = var.cost_center
      Environment = var.environment
      Project     = var.base_name
      ManagedBy   = "terraform"
    }
  }
}
