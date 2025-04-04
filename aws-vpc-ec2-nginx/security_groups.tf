resource "aws_security_group" "nginx-sg" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "nginx-sg"
  description = "Security group for Nginx server"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg"
  }
}
