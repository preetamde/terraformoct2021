# load the module
module "vpc_mainfrankfurt" {
    source = "../VPC"
    vpc_name = "devops"
    cidr_block = "10.15.0.0/16"
    public_subnet_1a = "10.15.16.0/24"
    public_subnet_1b = "10.15.17.0/24"
    public_subnet_1c = "10.15.18.0/24"
}
resource "aws_key_pair" "sshkeys" {
  key_name = var.privatekey
  public_key = file("${var.publickey}")
}
# instance in Zone-A
resource "aws_instance" "webserver-A" {
  ami = lookup(var.ami,var.aws_region)
  instance_type = var.instance_size
  # availability_zone = var.azs[0] - not required when subnet is provided
  subnet_id = module.vpc_mainfrankfurt.public_subnet_a
  user_data = file("webprovisioning.sh")
  vpc_security_group_ids = [ aws_security_group.webservers.id ]
  tags = {
    "Name" = "weba-${format("%03d", count.index)}"
  }
  count = 1
}
resource "aws_instance" "webserver-B" {
  ami = lookup(var.ami, var.aws_region)
  instance_type = var.instance_size
  # availability_zone = var.azs[1] - not required when subnet is provided
  subnet_id = module.vpc_mainfrankfurt.public_subnet_b
  vpc_security_group_ids = [ aws_security_group.webservers.id ]
  user_data = file("webprovisioning.sh")
  count = 1
  tags = {
    "Name" = "webb-${format("%03d", count.index)}"
  }
}
resource "aws_security_group" "webservers" {
  name = "webservers-sg-http-ssh"
  vpc_id = module.vpc_mainfrankfurt.vpc_id
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow anyone"
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Internet access"
  }
}