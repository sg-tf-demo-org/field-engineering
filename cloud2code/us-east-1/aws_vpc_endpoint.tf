resource "aws_vpc_endpoint" "data_recipes_apprunner_requests" {
  vpc_id = "vpc-046a1d2485887edea"
  service_name = "com.amazonaws.us-east-1.apprunner.requests"
  vpc_endpoint_type = "Interface"
  tags = {
    Name = "data-recipes-apprunner-requests"
  }
  lifecycle {
    ignore_changes = all
  }
}
