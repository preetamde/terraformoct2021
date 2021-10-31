variable "aws_region" {
  type        = string
  description = "AWS Region of your choice"
  default     = "eu-central-1"
}
variable "privatekey" {
  type        = string
  default     = "/Users/preetam_s007/Documents/aws_sshkeys/webuserpvt"
  description = "Private Key location"
}
variable "publickey" {
  type        = string
  default     = "/Users/preetam_s007/Documents/aws_sshkeys/webuserpvt.pub"
  description = "Public Key location"
}
variable "ami" {
  type        = map(string)
  description = "MAP of AMIs in eu-central"
  default = {
    "eu-central-1" = "ami-0475a1094262541b0"
    "eu-south-1"   = "ami-0dc7f0380719f2c23"
    "eu-north-1"   = "ami-0fe83d3a8d380317e"
  }
}
variable "instance_size" {
  type        = string
  default     = "t2.micro"
  description = "Instance Size"
}

variable "azs" {
  description = "Availability Zones"
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}