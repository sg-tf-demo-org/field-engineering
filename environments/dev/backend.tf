# Real backend — used at apply time with valid AWS credentials.
# The governance scanner uses backend_override.tf (local) to avoid needing
# live S3 backend credentials during plan-based policy checks.
#
# terraform {
#   backend "s3" {
#     bucket         = "fe-infra-otel-demo-state"
#     key            = "dev/fe-infra-otel-demo.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "fe-infra-otel-demo-locks"
#     encrypt        = true
#   }
# }
