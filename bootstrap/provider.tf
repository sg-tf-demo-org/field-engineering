terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Bootstrap uses a LOCAL backend on purpose: it creates the very S3 bucket +
  # DynamoDB table that every environment then uses as its remote backend.
  backend "local" {}
}

provider "aws" {
  region = var.region

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
