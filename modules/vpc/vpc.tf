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