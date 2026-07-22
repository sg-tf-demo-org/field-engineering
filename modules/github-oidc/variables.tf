variable "name_prefix" {
  description = "Prefix for all resources, e.g. dev-fe-infra-otel-demo."
  type        = string
}

variable "environment" {
  description = "Environment name used to scope the OIDC trust (dev/staging/prod). Maps to the GitHub Environment name."
  type        = string
}

variable "github_org" {
  description = "GitHub org."
  type        = string
  default     = "sg-tf-demo-org"
}

variable "github_repo" {
  description = "GitHub repo name."
  type        = string
  default     = "field-engineering"
}

variable "create_oidc_provider" {
  description = "Whether to create the account-wide GitHub OIDC provider. Exactly one env (dev) should create it; the others reference it by ARN."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}
