output "web-a-publicip" {
  value = aws_instance.webserver-A[*].public_ip
}
output "web-b-publicip" {
  value = aws_instance.webserver-B[*].public_ip
}