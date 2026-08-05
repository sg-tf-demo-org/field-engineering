variable "aws_region" {
  type        = string
  description = "AWS region for the parameter group (demo narrative)."
  default     = "us-west-2"
}

variable "parameter_group_name" {
  type        = string
  description = "Name of the demo Postgres parameter group."
  default     = "otel-demo-postgres-capacity"
}

variable "family" {
  type        = string
  description = "DB parameter group family."
  default     = "postgres16"
}

variable "max_connections" {
  type        = number
  description = "Postgres max_connections (baseline 50; remediate to 200)."
  default     = 50
}
