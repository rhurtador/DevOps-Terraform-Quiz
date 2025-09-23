provider "aws" {
  region = "eu-west-1"
}

# Crear la VPC privada
resource "aws_vpc" "private_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.vpc_tags
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.private_vpc.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.private_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "public-rt"
  }
}


# #Asociamos una route Table 
# resource "aws_route_table_association" "public" {
#   subnet_id      = var.subnet_id
#   route_table_id = aws_route_table.public.id

#   depends_on = [
#     aws_internet_gateway.gw  # Asegúrate de que la tabla de rutas se asocie después de que el gateway de Internet haya sido creado
#   ]
# }

# # Crear Network ACL para permitir SSH
# resource "aws_network_acl" "main" {
#   vpc_id = aws_vpc.main.id
# }

# resource "aws_network_acl_rule" "allow_ssh_in" {
#   network_acl_id = aws_network_acl.main.id
#   rule_number    = 100
#   egress         = false
#   protocol       = "tcp"
#   rule_action    = "allow"
#   cidr_block     = "192.168.1.8/32"  #Cambia esto a tu IP pública
#   from_port      = 22
#   to_port        = 22
# }

# resource "aws_network_acl_rule" "allow_ssh_out" {
#   network_acl_id = aws_network_acl.main.id
#   rule_number    = 100
#   egress         = true
#   protocol       = "tcp"
#   rule_action    = "allow"
#   cidr_block     = "0.0.0.0/0"
#   from_port      = 22
#   to_port        = 22
# }

# resource "aws_network_acl_association" "subnet_nacl" {
#   subnet_id      = var.subnet_id
#   network_acl_id = aws_network_acl.main.id
# }

# # Crear un Security Group para permitir SSH
# resource "aws_security_group" "allow_ssh" {
#   name        = "allow_ssh"
#   description = "Security Group para permitir SSH"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["192.168.1.8/32"]  # Cambia esto a tu IP pública
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
