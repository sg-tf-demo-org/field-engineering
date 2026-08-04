resource "aws_eks_cluster" "field_engineering" {
  name     = "field-engineering"
  role_arn = "arn:aws:iam::697091778198:role/AmazonEKSAutoClusterRole"
  version  = "1.36"
  vpc_config {
    subnet_ids              = ["subnet-0afdb75fdbfd2904e", "subnet-0e8b260435d8b9407"]
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }
  tags = {
  }
  lifecycle {
    ignore_changes = all
  }
}
