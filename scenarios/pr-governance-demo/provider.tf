terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Local backend on purpose: this scenario is a governance FAIL fixture that
  # must be PLANNABLE anywhere with only AWS creds. It must NEVER be applied,
  # so it deliberately carries no remote state / lock table.
}

# Region pinned to us-east-1 so the region gate PASSES and the CSPM + mandatory
# tags gates are the ones that FAIL (clearer bypass-path demo).
#
# NOTE: intentionally NO `default_tags` block here — that is what makes the
# mandatory-tags gate fire on the S3 bucket, EC2 instance and security group.
provider "aws" {
  region = "us-east-1"
}
