resource "aws_security_group" "data_recipes_apprunner_connector" {
  name = "data-recipes-apprunner-connector"
  description = "App Runner VPC connector for data-recipes-auth"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "data-recipes-apprunner-connector"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "data_recipes_apprunner_vpce" {
  name = "data-recipes-apprunner-vpce"
  description = "App Runner requests VPC endpoint"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "data-recipes-apprunner-vpce"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "eks_cluster_sg_field_engineering_1355143872" {
  name = "eks-cluster-sg-field-engineering-1355143872"
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "eks-cluster-sg-field-engineering-1355143872"
    "kubernetes.io/cluster/field-engineering" = "owned"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "grafana" {
  name = "grafana-34a0c5f406e19e0012bd6a58ea"
  description = "Managed by Terraform"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "grafana"
    Role = "grafana"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "grafana_sg" {
  name = "grafana-sg"
  description = "Grafana server - SSH and UI"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "grafana-sg"
    Role = "grafana"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "monitoring_node_exporter" {
  name = "monitoring-node-exporter-1188700b38d01cda3af8c3c890"
  description = "Managed by Terraform"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "monitoring-node-exporter"
    Project = "monitoring"
    Role = "node-exporter"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "monitoring_node_exporter_sg" {
  name = "monitoring-node-exporter-sg"
  description = "Node exporter target - SSH and metrics scrape"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "monitoring-node-exporter-sg"
    Project = "monitoring"
    Role = "node-exporter"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "monitoring_prometheus" {
  name = "monitoring-prometheus-c3833370e1cc7aa4d9684827ee"
  description = "Managed by Terraform"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "monitoring-prometheus"
    Project = "monitoring"
    Role = "prometheus"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "monitoring_prometheus_sg" {
  name = "monitoring-prometheus-sg"
  description = "Prometheus server - SSH and UI"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    Name = "monitoring-prometheus-sg"
    Project = "monitoring"
    Role = "prometheus"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "sg_080062c5821845f88" {
  name = "k8s-oteldemo-grafanal-82c227d398"
  description = "[k8s] Managed SecurityGroup for LoadBalancer"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    "eks:eks-cluster-name" = "field-engineering"
    "service.eks.amazonaws.com/resource" = "ManagedLBSecurityGroup"
    "service.eks.amazonaws.com/stack" = "otel-demo/grafana-lb"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "sg_09c8f5f3322127fc5" {
  name = "default"
  description = "default VPC security group"
  vpc_id = "vpc-046a1d2485887edea"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "sg_0bfe5e4329910998a" {
  name = "k8s-envoygat-envoyenv-5c8cf06830"
  description = "[k8s] Managed SecurityGroup for LoadBalancer"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    "eks:eks-cluster-name" = "field-engineering"
    "service.eks.amazonaws.com/resource" = "ManagedLBSecurityGroup"
    "service.eks.amazonaws.com/stack" = "envoy-gateway-system/envoy-envoy-gateway-system-envoy-gateway-dc2b3bc0"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "sg_0dc8b8e2eb216914c" {
  name = "k8s-traffic-fieldengineering-91b9e52a41"
  description = "[k8s] Shared Backend SecurityGroup for LoadBalancers"
  vpc_id = "vpc-046a1d2485887edea"
  tags = {
    "eks:eks-cluster-name" = "field-engineering"
    "ingress.eks.amazonaws.com/resource" = "ManagedBackendSecurityGroup"
    "service.eks.amazonaws.com/resource" = "ManagedBackendSecurityGroup"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_security_group" "sg_0deb66e0718436733" {
  name = "launch-wizard-1"
  description = "launch-wizard-1 created 2026-05-31T08:11:32.433Z"
  vpc_id = "vpc-046a1d2485887edea"
  lifecycle {
    ignore_changes = all
  }
}
