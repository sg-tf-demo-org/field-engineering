terraform {
  backend "s3" {
    bucket = "field-engineering-c2c-tfstate-697091778198"
    key    = "cloud2code/us-east-1/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
