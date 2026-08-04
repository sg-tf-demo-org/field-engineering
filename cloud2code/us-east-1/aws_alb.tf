resource "aws_alb" "arn_aws_elasticloadbalancing_us_east_1_697091778198_loadbalancer_net_k8s_envoygat_envoyenv_d1051f83bc_49ba7d951ac2554f" {
  name               = "k8s-envoygat-envoyenv-d1051f83bc"
  load_balancer_type = "network"
  internal           = false
  ip_address_type    = "ipv4"
  subnet_mapping {
    subnet_id = "subnet-072ee62ff1894ac04"
  }
  subnet_mapping {
    subnet_id = "subnet-0972201f32888f4a8"
  }
  tags = {
    "eks:eks-cluster-name" = "field-engineering"
    "service.eks.amazonaws.com/resource" = "LoadBalancer"
    "service.eks.amazonaws.com/stack" = "envoy-gateway-system/envoy-envoy-gateway-system-envoy-gateway-dc2b3bc0"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_alb" "arn_aws_elasticloadbalancing_us_east_1_697091778198_loadbalancer_net_k8s_oteldemo_grafanal_d41dc61cad_5d4f523f9906b6cd" {
  name               = "k8s-oteldemo-grafanal-d41dc61cad"
  load_balancer_type = "network"
  internal           = false
  ip_address_type    = "ipv4"
  subnet_mapping {
    subnet_id = "subnet-072ee62ff1894ac04"
  }
  subnet_mapping {
    subnet_id = "subnet-0972201f32888f4a8"
  }
  tags = {
    "eks:eks-cluster-name" = "field-engineering"
    "service.eks.amazonaws.com/resource" = "LoadBalancer"
    "service.eks.amazonaws.com/stack" = "otel-demo/grafana-lb"
  }
  lifecycle {
    ignore_changes = all
  }
}
