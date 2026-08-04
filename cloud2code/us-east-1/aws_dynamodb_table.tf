resource "aws_dynamodb_table" "aiden_checkout_orders_dev" {
  name = "aiden-checkout-orders-dev"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "orderId"
  tags = {
    AppStack = "checkout"
    CostCenter = "FE-DEMO"
    Environment = "dev"
    ManagedBy = "aiden"
    Owner = "platform"
  }
  attribute {
    name = "orderId"
    type = "S"
  }
  table_class = "STANDARD"
  read_capacity = 0
  write_capacity = 0
  stream_enabled = false
  point_in_time_recovery {
    enabled = false
  }
  server_side_encryption {
    enabled = true
  }
  ttl {
    enabled = false
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_dynamodb_table" "fe_infra_otel_demo_locks" {
  name = "fe-infra-otel-demo-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  tags = {
    CostCenter = "field-eng-demo"
    Environment = "prod"
    ManagedBy = "terraform"
    Name = "fe-infra-otel-demo-locks"
    Owner = "field-engineering"
    Project = "fe-infra-otel-demo"
  }
  attribute {
    name = "LockID"
    type = "S"
  }
  table_class = "STANDARD"
  read_capacity = 0
  write_capacity = 0
  stream_enabled = false
  point_in_time_recovery {
    enabled = true
  }
  server_side_encryption {
    enabled = true
    kms_key_arn = "arn:aws:kms:us-east-1:697091778198:key/bab14f0b-2bc3-4844-9aac-4325288930ad"
  }
  ttl {
    enabled = false
  }
  lifecycle {
    ignore_changes = all
  }
}
