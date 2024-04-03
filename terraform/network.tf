# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags       = merge(var.tags, { Name = "${var.EnvironmentName}" })
}

# Internet Gateway
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.EnvironmentName} IGW" })
}

# Public Subnet
resource "aws_subnet" "PublicSubnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 3, 0)
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"
  tags                    = merge(var.tags, { Name = "${var.EnvironmentName} Public Subnet (AZA)" })
}

resource "aws_subnet" "PublicSubnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 3, 2)
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"
  tags                    = merge(var.tags, { Name = "${var.EnvironmentName} Public Subnet (AZB)" })
}

resource "aws_subnet" "PublicSubnet3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 3, 4)
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}c"
  tags                    = merge(var.tags, { Name = "${var.EnvironmentName} Public Subnet (AZC)" })
}

# Private Subnet
resource "aws_subnet" "PrivateSubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 3, 1)
  availability_zone = "${var.region}a"
  tags       = merge(var.tags, { Name = "${var.EnvironmentName} Private Subnet (AZA)" })
}

resource "aws_subnet" "PrivateSubnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 3, 3)
  availability_zone       = "${var.region}b"
  tags       = merge(var.tags, { Name = "${var.EnvironmentName} Private Subnet (AZB)" })
}

resource "aws_subnet" "PrivateSubnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 3, 5)
  availability_zone       = "${var.region}C"
  tags       = merge(var.tags, { Name = "${var.EnvironmentName} Private Subnet (AZC)" })
}



# Nat Gateway

resource "aws_eip" "NatGateway1aEIP" {
  domain = "vpc"
  tags   = merge(var.tags, { Name = "${var.EnvironmentName} NAT Gateway1a EIP (AZA)" })
}

resource "aws_nat_gateway" "NatGateway1a" {
  allocation_id = aws_eip.NatGateway1aEIP.id
  subnet_id     = aws_subnet.PublicSubnet1.id
  tags          = merge(var.tags, { Name = "${var.EnvironmentName} NAT Gateway1a (AZA)" })
}

resource "aws_eip" "NatGateway1bEIP" {
  domain = "vpc"
  tags   = merge(var.tags, { Name = "${var.EnvironmentName} NAT Gateway1b EIP (AZB)" })
}

resource "aws_nat_gateway" "NatGateway1b" {
  allocation_id = aws_eip.NatGateway1bEIP.id
  subnet_id     = aws_subnet.PublicSubnet2.id
  tags          = merge(var.tags, { Name = "${var.EnvironmentName} NAT Gateway1b (AZB)" })
}

resource "aws_eip" "NatGateway1cEIP" {
  domain = "vpc"
  tags   = merge(var.tags, { Name = "${var.EnvironmentName} NAT Gateway1c EIP (AZC)" })
}

resource "aws_nat_gateway" "NatGateway1c" {
  allocation_id = aws_eip.NatGateway1cEIP.id
  subnet_id     = aws_subnet.PublicSubnet3.id
  tags          = merge(var.tags, { Name = "${var.EnvironmentName} NAT Gateway1c (AZC)" })
}

# Public Route Table

resource "aws_route_table" "PublicRouteTable" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.EnvironmentName} Public Route Table" })
}

resource "aws_route" "DefaultPublicRoute" {
  route_table_id         = aws_route_table.PublicRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_igw.id
  depends_on             = [ aws_internet_gateway.main_igw ]
}

resource "aws_route_table_association" "PublicSubnet1RouteTableAssociation" {
  subnet_id      = aws_subnet.PublicSubnet1.id
  route_table_id = aws_route_table.PublicRouteTable.id
}

resource "aws_route_table_association" "PublicSubnet2RouteTableAssociation" {
  subnet_id      = aws_subnet.PublicSubnet2.id
  route_table_id = aws_route_table.PublicRouteTable.id
}

resource "aws_route_table_association" "PublicSubnet3RouteTableAssociation" {
  subnet_id      = aws_subnet.PublicSubnet3.id
  route_table_id = aws_route_table.PublicRouteTable.id
}

# Private Route Table 1

resource "aws_route_table" "PrivateRouteTable1" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.EnvironmentName} Private Route Table1 (AZA)" })
}

resource "aws_route" "DefaultPrivateRoute1" {
  route_table_id         = aws_route_table.PrivateRouteTable1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NatGateway1a.id
}

resource "aws_route_table_association" "PrivateSubnet1RouteTableAssociation" {
  subnet_id      = aws_subnet.PrivateSubnet1.id
  route_table_id = aws_route_table.PrivateRouteTable1.id
}

# Private Route Table 2

resource "aws_route_table" "PrivateRouteTable2" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.EnvironmentName} Private Route Table2 (AZB)" })
}

resource "aws_route" "DefaultPrivateRoute2" {
  route_table_id         = aws_route_table.PrivateRouteTable2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NatGateway1b.id
}

resource "aws_route_table_association" "PrivateSubnet2RouteTableAssociation" {
  subnet_id      = aws_subnet.PrivateSubnet2.id
  route_table_id = aws_route_table.PrivateRouteTable2.id
}


# Private Route Table 3

resource "aws_route_table" "PrivateRouteTable3" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.EnvironmentName} Private Route Table3 (AZB)" })
}

resource "aws_route" "DefaultPrivateRoute3" {
  route_table_id         = aws_route_table.PrivateRouteTable3.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NatGateway1c.id
}

resource "aws_route_table_association" "PrivateSubnet3RouteTableAssociation" {
  subnet_id      = aws_subnet.PrivateSubnet3.id
  route_table_id = aws_route_table.PrivateRouteTable3.id
}