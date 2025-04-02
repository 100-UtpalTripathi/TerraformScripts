

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

# 1. VPC
resource "aws_vpc" "tripathi_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tripathi-vpc"
  }
}

# 2. Subnet
resource "aws_subnet" "tripathi_subnet" {
  vpc_id            = aws_vpc.tripathi_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tripathi-subnet"
  }
}

# 3. Security Group
resource "aws_security_group" "tripathi_sg" {
  name        = "tripathi-sg"
  description = "Allow SSH"
  vpc_id      = aws_vpc.tripathi_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (🔒 maybe restrict in prod!)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tripathi-sg"
  }
}

# 4. EC2 Instance (with subnet & security group)
resource "aws_instance" "tripathi_ec2" {
  ami           = "ami-00a929b66ed6e0de6"  # Double-check this is valid in us-east-1!
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.tripathi_subnet.id
  vpc_security_group_ids = [aws_security_group.tripathi_sg.id]

  tags = {
    Name = "tripathi-ec2"
  }
}
