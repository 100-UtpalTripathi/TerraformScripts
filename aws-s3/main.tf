terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.93.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "rand_id" {
    byte_length = 8
}

resource "aws_s3_bucket" "tripathi-s3-bucket" {
  bucket = "tripathi-s3-bucket-${random_id.rand_id.hex}"
  tags = {
    Name = "tripathi-s3-bucket"
  }
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.tripathi-s3-bucket.bucket
  key    = "data.txt"
  source = "./data.txt"
}