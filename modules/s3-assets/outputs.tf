output "bucket_id" {
  description = "The S3 bucket ID"
  value       = aws_s3_bucket.assets.id
}

output "bucket_arn" {
  description = "The S3 bucket ARN"
  value       = aws_s3_bucket.assets.arn
}

output "kms_key_arn" {
  description = "The ARN of the CMK used to encrypt the bucket"
  value       = aws_kms_key.assets.arn
}
