# define variables required to create VPC
/*
The following variables are unique per VPC and must be defined by the user
1. Name of the VPC
2. CIDR Block
3. Public Subnet or subnets required in each VPC
For others, you will see a default value defined
*/
variable "name" {
  type = string
  description = "Name of the VPC"
}
variable "cidr" {
  type = string
  description = "CIDR block for VPC"
}
variable "public_subnet_a" {
  type = string
  description = "Public subnet A for the web services"
}
variable "public_subnet_b" {
  type = string
  description = "Public subnet B for the web services"
}
variable "enable_dns_hostnames" {
  type = bool
  description = "Allow hostname resolution"
  default = true
}
variable "enable_dns_support" {
  type = bool
  description = "should be true for private DNS"
  default = true
}
