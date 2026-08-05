# Demo-owned Postgres capacity for Astronomy Shop / otel-demo UC4.
# Live shop DB is in-cluster; this TF is the declarative remediator (RDS-shaped).

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_db_parameter_group" "otel_demo_postgres" {
  name        = var.parameter_group_name
  family      = var.family
  description = "OTel demo Postgres capacity — max_connections owned in Git"

  parameter {
    name         = "max_connections"
    value        = tostring(var.max_connections)
    apply_method = "pending-reboot"
  }

  tags = {
    Project   = "otel-sre-demo"
    UseCase   = "UC4"
    ManagedBy = "aiden-infrastructure-engineer"
  }
}
