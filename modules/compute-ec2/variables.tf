variable "name_prefix" {
  description = "Prefix for all resources, e.g. dev-fe-infra-otel-demo."
  type        = string
}

variable "vpc_id" {
  description = "VPC id."
  type        = string
}

variable "subnet_id" {
  description = "Subnet id to place the instance in (private)."
  type        = string
}

variable "instance_type" {
  description = "Instance type (free-tier)."
  type        = string
  default     = "t3.micro"
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}
