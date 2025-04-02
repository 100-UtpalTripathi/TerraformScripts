output "bucket_name" {
  value       = aws_s3_bucket.tripathi-s3-bucket.bucket
  description = "Name of the created S3 bucket"
}
