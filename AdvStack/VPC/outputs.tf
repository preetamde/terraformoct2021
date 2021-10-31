#modules outputs
output "vpc_id" {
  value = aws_vpc.vpc_devops.id
  description = "VPC ID for reference"
}
output "public_subnet_a" {
  value = aws_subnet.subnet_pb_1a.id
  description = "Subnet ID in 1a"
}
output "public_subnet_b" {
  value = aws_subnet.subnet_pb_1b.id
  description = "Subnet ID in 1b"
}
output "public_subnet_c" {
  value = aws_subnet.subnet_pb_1c.id
  description = "Subnet ID in 1c"
}