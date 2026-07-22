output "deploy_role_arn" {
  description = "ARN of the per-env deploy role assumed by GitHub Actions via OIDC."
  value       = aws_iam_role.deploy.arn
}

output "deploy_role_name" {
  description = "Name of the per-env deploy role."
  value       = aws_iam_role.deploy.name
}

output "oidc_provider_arn" {
  description = "ARN of the GitHub OIDC provider used for the trust."
  value       = local.provider_arn
}
