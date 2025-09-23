variable "name" {
  description = "Nombre del Load Balancer"
  type        = string
}

variable "internal" {
  description = "Si el Load Balancer es interno o no"
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "Grupos de seguridad asociados al Load Balancer"
  type        = list(string)
}

variable "subnets" {
  description = "Subredes donde estará el Load Balancer"
  type        = list(string)
}

variable "lb_tags" {
  description = "Etiquetas para el Load Balancer"
  type        = map(string)
  default     = {}
}
