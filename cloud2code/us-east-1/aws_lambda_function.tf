resource "aws_lambda_function" "fe_drift_formatter" {
  function_name = "fe-drift-formatter"
  role = "arn:aws:iam::697091778198:role/field-engineering-drift-monitor-FormatterRole-5WFcKtGjlMTX"
  handler = "index.handler"
  runtime = "python3.12"
  tags = {
    CostCenter = "FE-DEMO"
    Environment = "dev"
    Owner = "platform"
  }
  filename = "lambda-placeholder.zip"
  lifecycle {
    ignore_changes = all
  }
}
