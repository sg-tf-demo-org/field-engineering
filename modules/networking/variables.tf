variable "name_prefix" {
  description = "Prefix for all resources, e.g. dev-fe-infra-otel-demo."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the dedicated VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "azs" {
  description = "Availability zones to spread subnets across (must be in us-east-1)."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}
