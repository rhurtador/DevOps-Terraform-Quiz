# CIDR block para la VPC
variable "vpc_cidr_block" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Etiquetas para la VPC
variable "vpc_tags" {
  description = "Etiquetas para la VPC"
  type        = map(string)
  default     = {
    Name = "private-vpc"
  }
}