
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
  
}

output "public_subnets" {
  description = "Public Subnet IDs and Availability Zones"
  value       = module.vpc.public_subnet
  
}

output "private_subnets" {
  description = "Private Subnet IDs and Availability Zones"
  value       = module.vpc.private_subnet
  
}