resource "aws_vpc" "vpc_046a1d2485887edea" {
  cidr_block = "172.31.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"
  assign_generated_ipv6_cidr_block = false
  lifecycle {
    ignore_changes = all
  }
}
