resource "aws_internet_gateway" "igw_01c3397bf2566df1d" {
  vpc_id = "vpc-046a1d2485887edea"
  lifecycle {
    ignore_changes = all
  }
}
