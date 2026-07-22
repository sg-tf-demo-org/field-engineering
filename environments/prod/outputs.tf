output "vpc_id" {
  value = module.networking.vpc_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "workload_instance_id" {
  value = module.compute.instance_id
}

output "runner_instance_id" {
  value = module.runner.instance_id
}

output "deploy_role_arn" {
  value = module.github_oidc.deploy_role_arn
}
