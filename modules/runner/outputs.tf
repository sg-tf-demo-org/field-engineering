output "instance_id" {
  description = "Runner EC2 instance id."
  value       = module.runner.id
}

output "private_ip" {
  description = "Runner private IP."
  value       = module.runner.private_ip
}

output "iam_role_arn" {
  description = "Runner instance IAM role ARN."
  value       = aws_iam_role.runner.arn
}
