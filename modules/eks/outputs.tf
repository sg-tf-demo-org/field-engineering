output "cluster_name" {
  description = "EKS cluster name."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API server endpoint."
  value       = module.eks.cluster_endpoint
}

output "cluster_arn" {
  description = "EKS cluster ARN."
  value       = module.eks.cluster_arn
}

output "cluster_security_group_id" {
  description = "Cluster security group id."
  value       = module.eks.cluster_security_group_id
}

output "kms_key_arn" {
  description = "CMK ARN protecting cluster secrets."
  value       = module.eks.kms_key_arn
}
