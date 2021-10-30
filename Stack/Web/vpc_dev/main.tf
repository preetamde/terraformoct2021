# We are creating a blank VPC Framework and filling the required data using variables
resource "aws_vpc" "devvpc" {
    cidr_block = var.cidr
    enable_dns_support = var.enable_dns_support
    enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    "Name" = var.name
  }
}
# internet gateway
resource "aws_internet_gateway" "devvpc-igw" {
    vpc_id = aws_vpc.devvpc.id
    tags = {
        Name = "${var.name}-igw"
    }
}
# route table for internet
resource "aws_route" "internet-route" {
  route_table_id = aws_vpc.devvpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.devvpc-igw.id
}
# public subnet Zone 1a
resource "aws_subnet" "public-a" {
    vpc_id = aws_vpc.devvpc.id
    cidr_block = var.public_subnet_a
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.name}-public-a"
    }
}
# public subnet Zone 1b
resource "aws_subnet" "public-b" {
    vpc_id = aws_vpc.devvpc.id
    cidr_block = var.public_subnet_b
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.name}-public-b"
    }
}