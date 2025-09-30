variable "vpc_id" {
  description = "ID de la VPC donde se creará la subred"
  type        = string
}

variable "cidr_block" {
  description = "Bloque CIDR para la subred"
  type        = string
}

variable "subnet_tags" {
  description = "Etiquetas para la subred"
  type        = map(string)
}

variable "subnet_name" {
  description = "Nombre de la Subnet"
  type        = string
  default     = "default-subnet"
}

variable "route_table_id" {
  description = "ID de la tabla de rutas a asociar"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidad para la subred"
  type        = string
  default     = null
}
