variable "bucket_name" {
  description = "Name of the S3 bucket."
  type        = string
  default     = "fe-demo-cmk-bucket"
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {
    Owner       = "platform"
    CostCenter  = "FE-DEMO"
    Environment = "dev"
  }
}
