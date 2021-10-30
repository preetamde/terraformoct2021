output "public_subnet_id_a" {
  value = aws_subnet.public-a.id
  description = "Public subnet A"
}
output "public_subnet_id_b" {
  value = aws_subnet.public-b.id
  description = "Public subnet B"
}
output "vpc_id" {
  value = aws_vpc.devvpc.id
  description = "VPC ID of the main VPC"
}
output "cidr" {
  value = aws_vpc.devvpc.cidr_block
  description = "cidr block of the VPC"
}