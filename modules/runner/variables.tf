variable "name_prefix" {
  description = "Prefix for all resources, e.g. dev-fe-infra-otel-demo."
  type        = string
}

variable "vpc_id" {
  description = "VPC id."
  type        = string
}

variable "subnet_id" {
  description = "Subnet id (private, with NAT egress) for the runner."
  type        = string
}

variable "instance_type" {
  description = "Instance type (free-tier)."
  type        = string
  default     = "t3.micro"
}

variable "github_repo_url" {
  description = "Full https URL of the GitHub repo the runner registers to."
  type        = string
  default     = "https://github.com/sg-tf-demo-org/field-engineering"
}

variable "runner_registration_token" {
  description = "Short-lived GitHub Actions runner registration token. Supplied at apply time (e.g. TF_VAR_runner_registration_token) — NEVER committed. Empty means the instance boots without registering."
  type        = string
  default     = ""
  sensitive   = true
}

variable "runner_labels" {
  description = "Labels for the self-hosted runner."
  type        = string
  default     = "self-hosted,linux,x64,fe-infra-otel-demo"
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}
