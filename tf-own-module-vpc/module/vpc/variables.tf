variable "vpc-config" {
  description = "VPC configuration : Provide the VPC name and CIDR block"
  type = object({
    name       = string
    cidr_block = string
  })

}

variable "subnet-config" {
  description = "Subnet configuration : Provide the CIDR block and availability zone"
  type = map(object({
    cidr_block = string
    az         = string
    public = optional(bool, false)
  }))
}
