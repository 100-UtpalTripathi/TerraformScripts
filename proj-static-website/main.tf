terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.93.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

provider "aws" {
  region = var.region
}

# Random suffix for unique bucket name
resource "random_id" "rand_id" {
  byte_length = 8
}

# Create the S3 bucket
resource "aws_s3_bucket" "tripathi_s3_bucket" {
  bucket = "tripathi-s3-bucket-${random_id.rand_id.hex}"

  tags = {
    Name = "tripathi-s3-bucket"
  }
}

# Enable public access to the bucket (set to false = allow)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.tripathi_s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Add bucket policy to allow public reads
resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.tripathi_s3_bucket.id

  depends_on = [
    aws_s3_bucket_public_access_block.public_access
  ]
  # Policy to allow public read access
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = [
          "arn:aws:s3:::${aws_s3_bucket.tripathi_s3_bucket.bucket}/*"
        ]
      }
    ]
  })
}

# Enable website hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.tripathi_s3_bucket.id

  index_document {
    suffix = "index.html"
  }
}

# Upload index.html
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.tripathi_s3_bucket.bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
}

# Upload styles.css
resource "aws_s3_object" "styles_css" {
  bucket       = aws_s3_bucket.tripathi_s3_bucket.bucket
  key          = "styles.css"
  source       = "./styles.css"
  content_type = "text/css"
}
