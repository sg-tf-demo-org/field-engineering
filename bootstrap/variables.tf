variable "region" {
  description = "AWS region for the Terraform remote-state backend (governance: us-east-1 only)."
  type        = string
  default     = "us-east-1"
}

variable "base_name" {
  description = "Base name for all demo resources."
  type        = string
  default     = "fe-infra-otel-demo"
}

variable "owner" {
  description = "Owner tag applied to backend resources."
  type        = string
  default     = "field-engineering"
}

variable "cost_center" {
  description = "CostCenter tag applied to backend resources."
  type        = string
  default     = "field-eng-demo"
}

variable "environment" {
  description = "Environment tag for the shared backend (must be one of dev/staging/prod)."
  type        = string
  default     = "prod"
}
