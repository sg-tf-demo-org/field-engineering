variable "name_prefix" {
  description = "Prefix for all resources, e.g. dev-fe-infra-otel-demo."
  type        = string
}

variable "cluster_version" {
  description = "EKS control plane version (source of truth: 1.36)."
  type        = string
  default     = "1.36"
}

variable "vpc_id" {
  description = "VPC id the cluster runs in."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet ids for the cluster / Auto Mode nodes (private)."
  type        = list(string)
}

variable "node_pools" {
  description = "EKS Auto Mode built-in node pools."
  type        = list(string)
  default     = ["general-purpose", "system"]
}

variable "endpoint_public_access" {
  description = "Whether the API server endpoint is public. Default false (private-only) for a clean governance posture."
  type        = bool
  default     = false
}

variable "public_access_cidrs" {
  description = "CIDRs allowed to reach the public endpoint (only used when endpoint_public_access = true; never 0.0.0.0/0)."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}
