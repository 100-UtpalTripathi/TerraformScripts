output "bucket_name" {
  value       = aws_s3_bucket.tripathi-s3-bucket.bucket
  description = "Name of the created S3 bucket"
}

output "bucket_random_id" {
  value       = random_id.rand_id.hex
  description = "Random ID generated for the S3 bucket"
  
}