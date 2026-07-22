output "instance_id" {
  description = "EC2 instance id."
  value       = module.ec2.id
}

output "private_ip" {
  description = "Private IP of the workload instance."
  value       = module.ec2.private_ip
}

output "security_group_id" {
  description = "Workload security group id."
  value       = aws_security_group.this.id
}
