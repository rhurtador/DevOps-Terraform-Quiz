# variable "ami_id" {
#   description = "AMI ID de la instancia EC2"
#   type        = string
# }

# variable "instance_type" {
#   description = "Tipo de instancia EC2"
#   type        = string
# }

# variable "ec2_key_name" {
#   description = "Nombre del Key Pair para la instancia EC2"
#   type        = string
# }

# variable "subnet_id" {
#   description = "ID de la Subnet para la EC2"
#   type        = string
# }

# variable "security_group_ids" {
#   description = "Lista de SGs a asociar a la EC2"
#   type        = list(string)
# }

# variable "ec2_tags" {
#   description = "Etiquetas para la instancia EC2"
#   type        = map(string)
# }

# variable "public_key_path" {
#   description = "Ruta al archivo que contiene tu clave pública"
#   type        = string
# }

# variable "ec2_name" {
#   description = "Nombre de la instancia EC2"
#   type        = string
#   default     = "default-ec2-instance"
# }