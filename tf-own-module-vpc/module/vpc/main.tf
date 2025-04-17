resource "aws_vpc" "main" {
  cidr_block = var.vpc-config.cidr_block
  tags = {
    Name = var.vpc-config.name
  }
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id

  for_each = var.subnet-config

  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az
  tags = {
    Name = "${var.vpc-config.name}-${each.key}"
  }
}

locals {
  public_subnet = {
    for key, config in var.subnet-config : key => config if config.public
  }
  private_subnet = {
    for key, config in var.subnet-config : key => config if !config.public
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  count  = length(local.public_subnet) > 0 ? 1 : 0

  tags = {
    Name = "${var.vpc-config.name}-igw"
  }
}
