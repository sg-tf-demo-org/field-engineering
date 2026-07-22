variable "region" {
  description = "AWS region (governance: us-east-1 only)."
  type        = string
  default     = "us-east-1"
}

variable "base_name" {
  description = "Base name for all resources."
  type        = string
  default     = "fe-infra-otel-demo"
}

variable "env_prefix" {
  description = "Environment resource prefix (dev/stage/prod)."
  type        = string
}

variable "environment" {
  description = "Environment tag value (dev/staging/prod)."
  type        = string
}

variable "owner" {
  description = "Owner tag."
  type        = string
  default     = "field-engineering"
}

variable "cost_center" {
  description = "CostCenter tag."
  type        = string
  default     = "field-eng-demo"
}

variable "vpc_cidr" {
  description = "Dedicated VPC CIDR for this env."
  type        = string
}

variable "azs" {
  description = "Availability zones (us-east-1)."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "cluster_version" {
  description = "EKS version."
  type        = string
  default     = "1.36"
}

variable "create_oidc_provider" {
  description = "Create the account-wide GitHub OIDC provider from this env (only one env should)."
  type        = bool
  default     = false
}

variable "runner_registration_token" {
  description = "GitHub runner registration token, supplied via TF_VAR at apply time (never committed)."
  type        = string
  default     = ""
  sensitive   = true
}
