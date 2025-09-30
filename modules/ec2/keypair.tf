# Crear Key Pair
# Genera una clave privada
resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Crea el par de claves en AWS
resource "aws_key_pair" "main" {
  key_name   = var.ec2_key_name
  public_key = tls_private_key.main.public_key_openssh
}

# Guardar la clave privada en un archivo local
resource "local_file" "private_key" {
  content  = tls_private_key.main.private_key_pem
  filename = "${path.module}/id_rsa"
}