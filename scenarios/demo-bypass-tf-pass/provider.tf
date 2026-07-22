terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Local backend on purpose: this demo stack is plan-only and must never be applied.
}

provider "aws" {
  region = "us-east-1"
}
