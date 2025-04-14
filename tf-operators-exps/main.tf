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

locals {
  Name = "Tripathi-Project-1"
}

resource "aws_s3_bucket" "MyBucket" {
  bucket = "${local.Name}-bucket-${count.index}"
  count = 2

  tags = {
    Name        = "$(local.Name)-bucket-${count.index}"
    Environment = "Dev"
  }
  
}