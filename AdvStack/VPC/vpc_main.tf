resource "aws_vpc" "vpc_devops" {
  cidr_block = var.cidr_block # needs input
  instance_tenancy = var.tenancy
  enable_dns_hostnames = var.dns_hostnames
  enable_dns_support = var.dns_support
  tags = {
    "Name" = var.vpc_name
  }
}
# internet gateway
resource "aws_internet_gateway" "igw_devops" {
  vpc_id = aws_vpc.vpc_devops.id
  tags = {
    "Name" = "IGW_devops"
  }
}
#route table for the internet
resource "aws_route" "mainroute" {
  route_table_id = aws_vpc.vpc_devops.main_route_table_id #careful it is not just id, it is different
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw_devops.id
}
# public 1a subnet
resource "aws_subnet" "subnet_pb_1a" {
    vpc_id = aws_vpc.vpc_devops.id
    cidr_block = var.public_subnet_1a #needs input
    map_public_ip_on_launch = var.publicip_allocation # needs input
    availability_zone = "eu-central-1a"
    tags = {
      "Name" = "${var.vpc_name}-public-1a"
    }
}
resource "aws_subnet" "subnet_pb_1b" {
  vpc_id = aws_vpc.vpc_devops.id
  cidr_block = var.public_subnet_1b #needs input
  map_public_ip_on_launch = var.publicip_allocation # needs input
  availability_zone = "eu-central-1b"
  tags = {
    "Name" = "${var.vpc_name}-public-1b"
  }
}
resource "aws_subnet" "subnet_pb_1c" {
  vpc_id = aws_vpc.vpc_devops.id
  cidr_block = var.public_subnet_1c # needs input
  map_public_ip_on_launch = var.publicip_allocation # needs input
  availability_zone = "eu-central-1c"
  tags = {
    "Name" = "${var.vpc_name}-public-1c"
  }
}