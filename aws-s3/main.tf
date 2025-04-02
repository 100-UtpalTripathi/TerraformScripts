terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.93.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "tripathi-s3-bucket" {
  bucket = "tripathi-s3-bucket"
  tags = {
    Name = "tripathi-s3-bucket"
  }
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.tripathi-s3-bucket.bucket
  key    = "data.txt"
  source = "./data.txt"
}