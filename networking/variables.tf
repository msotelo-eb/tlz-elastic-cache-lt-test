variable "vpc_cidr" {
  type = string
  default = "10.123.0.0/16"
}

locals {
  subnet_public_cidrs = [for i in range(2, 255, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

# INPUT VARIABLES
variable "subnet_count" {
  type = number
}