terraform {
  backend "s3" {
    bucket         = "fe-infra-otel-demo-state"
    key            = "dev/fe-infra-otel-demo.tfstate"
    region         = "us-east-1"
    dynamodb_table = "fe-infra-otel-demo-locks"
    encrypt        = true
  }
}
