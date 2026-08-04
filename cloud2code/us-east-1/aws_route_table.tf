resource "aws_route_table" "data_recipes_private_rt" {
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "data-recipes-private-rt"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route_table" "rtb_059d87257b68d053a" {
  vpc_id = "vpc-046a1d2485887edea"
  lifecycle {
    ignore_changes = all
  }
}
