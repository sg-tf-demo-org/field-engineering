variable "bucket_name" {
  description = "Name of the (deliberately non-compliant) demo S3 bucket."
  type        = string
  default     = "pr-gov-demo-public-assets-fe-otel"
}

variable "instance_type" {
  description = "EC2 instance type for the demo host (free-tier friendly)."
  type        = string
  default     = "t3.micro"
}
