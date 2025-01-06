variable "instance_type" {
  description = "Instance type for AWS EC2 resources"
  type        = string
  default     = "t2.micro"
}

variable "access_key" {
  description = "Access key for AWS"
  type        = string
}

variable "secret_key" {
  description = "Secret key for AWS"
  type        = string
}

variable "session_token" {
  description = "AWS session token"
  type        = string
}