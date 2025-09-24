resource "aws_subnet" "main" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = true
  tags                    = var.subnet_tags
}

# resource "aws_route_table_association" "public_assoc" {
#   count          = var.route_table_id == "" ? 0 : 1
#   subnet_id      = aws_subnet.main.id
#   route_table_id = var.route_table_id
# }

resource "aws_route_table_association" "public_assoc" {
  for_each       = var.route_table_id != "" ? toset([var.route_table_id]) : []
  subnet_id      = aws_subnet.main.id
  route_table_id = each.value
}
