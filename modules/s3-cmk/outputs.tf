output "bucket_id" {
  description = "S3 bucket ID."
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "S3 bucket ARN."
  value       = aws_s3_bucket.this.arn
}

output "kms_key_arn" {
  description = "ARN of the CMK used to encrypt the bucket."
  value       = aws_kms_key.s3.arn
}
