output "ec2_instance_public_ip" {
  value = aws_instance.tripathi_ec2.private_ip
  description = "Public IP of the EC2 instance"
  
}