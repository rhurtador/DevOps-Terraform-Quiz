# # Reglas de entrada (ingress)
# variable "ingress_rules" {
#   description = "Lista de reglas de entrada (ingress)"
#   type = list(object({
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#     description = string
#   }))
#   default = [
#     {
#       from_port   = 9443
#       to_port     = 9443
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#       description = "Permitir tráfico en el puerto 9443"
#     },
#     {
#       from_port   = 443
#       to_port     = 443
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#       description = "Permitir tráfico en el puerto 443"
#     },
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["10.0.0.0/16"]
#       description = "Permitir SSH dentro de la VPC"
#     }
#   ]
# }

# # Reglas de salida (egress)
# variable "egress_rules" {
#   description = "Lista de reglas de salida (egress)"
#   type = list(object({
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#     description = string
#   }))
#   default = [
#     {
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#       description = "Permitir todo el tráfico saliente"
#     }
#   ]
# }

# variable "security_group_name" {
#   description = "Nombre del Security Group"
#   type        = string
# }

# variable "security_group_description" {
#   description = "Descripción del Security Group"
#   type        = string
# }

# variable "security_group_vpc_id" {
#   description = "ID de la VPC donde se creará el Security Group"
#   type        = string
# }

# variable "tags" {
#   description = "Etiquetas para el Security Group"
#   type        = map(string)
#   default     = {}
# }