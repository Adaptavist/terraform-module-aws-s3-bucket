output "website_bucket_id" {
  value = aws_s3_bucket.this.id
}

output "website_bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "website_bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "website_bucket_dns" {
  value = aws_s3_bucket.this.bucket_domain_name
}

output "logging_bucket_id" {
  value = var.logging_enabled && var.logging_config != null ? aws_s3_bucket.logging[0].id : ""
}

output "logging_bucket_arn" {
  value = var.logging_enabled && var.logging_config != null ? aws_s3_bucket.logging[0].arn : ""
}

output "logging_bucket_name" {
  value = var.logging_enabled && var.logging_config != null ? aws_s3_bucket.logging[0].bucket : ""
}