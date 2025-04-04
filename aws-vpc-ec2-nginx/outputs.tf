output "instance_public_ip" {
  value = aws_instance.nginxserver.public_ip
  description = "value of the public IP address of the EC2 instance"
  
}

output "instance_url" {
  value = "http://${aws_instance.nginxserver.public_ip}"
  description = "URL to access the Nginx server"
  
}