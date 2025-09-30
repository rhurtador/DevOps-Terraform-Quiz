# Reglas de entrada (ingress)
variable "ingress_rules" {
  description = "Lista de reglas de entrada (ingress)"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

# Reglas de salida (egress)
variable "egress_rules" {
  description = "Lista de reglas de salida (egress)"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "security_group_name" {
  description = "Nombre del Security Group"
  type        = string
}

variable "security_group_description" {
  description = "Descripción del Security Group"
  type        = string
}

variable "security_group_vpc_id" {
  description = "ID de la VPC donde se creará el Security Group"
  type        = string
}

variable "tags" {
  description = "Etiquetas para el Security Group"
  type        = map(string)
  default     = {}
}