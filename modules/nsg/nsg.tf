# # resource "aws_security_group" "eks_security_group" {
# #   name        = var.name
# #   description = var.description
# #   vpc_id      = aws_vpc.main.id #var.vpc_id

# resource "aws_security_group" "eks_security_group" {
#   name        = var.security_group_name
#   description = var.security_group_description
#   vpc_id      = var.security_group_vpc_id

#   # Reglas de entrada dinámicas
#   dynamic "ingress" {
#     for_each = var.ingress_rules
#     content {
#       from_port   = ingress.value.from_port
#       to_port     = ingress.value.to_port
#       protocol    = ingress.value.protocol
#       cidr_blocks = ingress.value.cidr_blocks
#       description = lookup(ingress.value, "description", null)
#     }
#   }

#   # Reglas de salida dinámicas
#   dynamic "egress" {
#     for_each = var.egress_rules
#     content {
#       from_port   = egress.value.from_port
#       to_port     = egress.value.to_port
#       protocol    = egress.value.protocol
#       cidr_blocks = egress.value.cidr_blocks
#       description = lookup(egress.value, "description", null)
#     }
#   }

#   tags = var.tags
# }

# output "security_group_id" {
#   value = aws_security_group.eks_security_group.id
# }