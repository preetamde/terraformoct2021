variable "vpc_name" {
  type = string
  description = "Provide the name of the VPC"
}
variable "cidr_block" {
  type = string
  description = "Choose the CIDR block for your VPC"
}
variable "tenancy" {
  type = string
  description = "Tenancy model"
  default = "default"
}
variable "dns_support" {
  type = bool
  description = "DNS Support is default true"
  default = true
}
variable "dns_hostnames" {
  type = bool
  description = "DNS Hostname support is false"
  default = true
}
# variables for subnets
variable "public_subnet_1a" {
  type = string
  description = "Public Subnet in AZ-1a"
}
variable "public_subnet_1b" {
  type = string
  description = "Public Subnet in AZ-1b"
}
variable "public_subnet_1c" {
  type = string
  description = "Public Subnet in AZ-1c"
}
variable "publicip_allocation" {
  type = bool
  description = "Does all instances need a public ip"
  default = true
}