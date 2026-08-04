resource "aws_route53_zone" "_hostedzone_z02227871u9dywib2hbu" {
  name = "myww9jtvbf.us-east-1.awsapprunner.com"
  comment = "Private App Runner upstream for data-recipes"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_zone" "_hostedzone_z04651531uls293y1eqt" {
  name = "stackgen.run"
  comment = "HostedZone created by Route53 Registrar"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_zone" "aiden_xc7sh_int" {
  name = "aiden.aiden-sno.test"
  comment = "Created by Openshift Installer"
  tags = {
    Name = "aiden-xc7sh-int"
    "kubernetes.io/cluster/aiden-xc7sh" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}
