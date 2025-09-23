# ID del Security Group creado
output "security_group_id" {
  description = "ID del Security Group creado"
  value       = aws_security_group.this.id
}

# Nombre del Security Group creado
output "security_group_name" {
  description = "Nombre del Security Group creado"
  value       = aws_security_group.this.name
}