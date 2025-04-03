output "bucket_name" {
  value       = aws_s3_bucket.tripathi_s3_bucket.bucket
  description = "Name of the created S3 bucket"
}


output "s3_website_url" {
  value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
  description = "Public URL of the hosted website"
}
