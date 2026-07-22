output "state_bucket" {
  description = "Name of the Terraform remote-state S3 bucket."
  value       = aws_s3_bucket.state.id
}

output "lock_table" {
  description = "Name of the DynamoDB state-lock table."
  value       = aws_dynamodb_table.locks.name
}

output "kms_key_arn" {
  description = "ARN of the CMK protecting remote state."
  value       = aws_kms_key.state.arn
}
