resource "aws_subnet" "data_recipes_private_1a" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.96.0/20"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "data-recipes-private-1a"
  }
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "data_recipes_private_1b" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.112.0/20"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "data-recipes-private-1b"
  }
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "data_recipes_public_1a" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.128.0/20"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "data-recipes-public-1a"
    "kubernetes.io/cluster/field-engineering" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "data_recipes_public_1b" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.144.0/20"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "data-recipes-public-1b"
    "kubernetes.io/cluster/field-engineering" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "subnet_00044780c137ede47" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.32.0/20"
  availability_zone = "us-east-1d"
  map_public_ip_on_launch = true
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "subnet_00c414e1920cdf388" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.16.0/20"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "subnet_0257b21f5dcf7afdd" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.80.0/20"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "subnet_04bba76a2d2c3556f" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.48.0/20"
  availability_zone = "us-east-1e"
  map_public_ip_on_launch = true
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "subnet_06870729dae4f5819" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.0.0/20"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_subnet" "subnet_06fa375639a133d82" {
  vpc_id = "vpc-046a1d2485887edea"
  cidr_block = "172.31.64.0/20"
  availability_zone = "us-east-1f"
  map_public_ip_on_launch = true
  assign_ipv6_address_on_creation = false
  lifecycle {
    ignore_changes = all
  }
}
