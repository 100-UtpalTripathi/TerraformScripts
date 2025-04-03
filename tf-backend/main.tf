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

  backend "s3" {
    bucket         = "tripathi-s3-bucket-49429157260fcf93"
    key            = "backend.tfstate"
    region         = "us-east-1"
    
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "rand_id" {
    byte_length = 8
}

resource "aws_s3_bucket" "tripathi-backend-s3-bucket" {
  bucket = "tripathi-backend-s3-bucket-${random_id.rand_id.hex}"
  tags = {
    Name = "tripathi-backend-s3-bucket"
  }
}