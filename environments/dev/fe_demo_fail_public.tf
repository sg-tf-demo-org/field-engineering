
resource "aws_s3_bucket" "fe_demo_bad" {
  bucket_prefix = "fe-demo-bad-"
  acl           = "public-read"
}

resource "aws_security_group" "fe_demo_ssh" {
  name_prefix = "fe-demo-ssh-"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
