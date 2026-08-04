resource "aws_route53_resolver_rule_association" "rslvr_autodefined_assoc_vpc_046a1d2485887edea_internet_resolver" {
  resolver_rule_id = "rslvr-autodefined-rr-internet-resolver"
  vpc_id = "vpc-046a1d2485887edea"
  name = "System Rule Association"
  lifecycle {
    ignore_changes = all
  }
}
