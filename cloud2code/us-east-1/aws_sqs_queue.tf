resource "aws_sqs_queue" "https___sqs_us_east_1_amazonaws_com_697091778198_aiden_checkout_dlq_dev" {
  name = "aiden-checkout-dlq-dev"
  fifo_queue = false
  tags = {
    AppStack = "checkout"
    CostCenter = "FE-DEMO"
    Environment = "dev"
    ManagedBy = "aiden"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_sqs_queue" "https___sqs_us_east_1_amazonaws_com_697091778198_aiden_checkout_orders_dev" {
  name = "aiden-checkout-orders-dev"
  fifo_queue = false
  tags = {
    AppStack = "checkout"
    CostCenter = "FE-DEMO"
    Environment = "dev"
    ManagedBy = "aiden"
    Owner = "platform"
  }
  lifecycle {
    ignore_changes = all
  }
}
