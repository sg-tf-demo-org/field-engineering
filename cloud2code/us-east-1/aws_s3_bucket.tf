resource "aws_s3_bucket" "aiden_demo_demo_assets_dev_demoassetsbucket_hblmsoqps6ql" {
  bucket = "aiden-demo-demo-assets-dev-demoassetsbucket-hblmsoqps6ql"
  tags = {
    CostCenter = "FE-DEMO"
    Environment = "dev"
    ManagedBy = "aiden"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_s3_bucket" "fe_drift_cloudtrail_697091778198_us_east_1" {
  bucket = "fe-drift-cloudtrail-697091778198-us-east-1"
  tags = {
    CostCenter = "FE-DEMO"
    Environment = "dev"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_s3_bucket" "fe_infra_otel_demo_state" {
  bucket = "fe-infra-otel-demo-state"
  tags = {
    CostCenter = "field-eng-demo"
    Environment = "prod"
    ManagedBy = "terraform"
    Name = "fe-infra-otel-demo-state"
    Owner = "field-engineering"
    Project = "fe-infra-otel-demo"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_s3_bucket" "fss_15072026" {
  bucket = "fss-15072026"
  tags = {
    ManagedBy = "terraform"
    Project = "s3-bucket"
  }
  lifecycle {
    ignore_changes = all
  }
}
