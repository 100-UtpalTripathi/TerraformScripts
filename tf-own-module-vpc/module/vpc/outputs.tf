output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
  
}

locals {
  public_subnet_output = {
    for key, config in local.public_subnet : key => {
        subnet_id = aws_subnet.main[key].id
        az = aws_subnet.main[key].availability_zone
    }
  }
  private_subnet_output = {
    for key, config in local.private_subnet : key => {
        subnet_id = aws_subnet.main[key].id
        az = aws_subnet.main[key].availability_zone
    }
  }
}

output "public_subnet" {
  description = "Public Subnet IDs and Availability Zones"
  value       = local.public_subnet_output
  
}

output "private_subnet" {
  description = "Private Subnet IDs and Availability Zones"
  value = local.private_subnet_output
  
}

