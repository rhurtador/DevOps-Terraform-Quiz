# VPC Variables
variable "vpc_cidr_block" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_tags" {
  description = "Etiquetas para la VPC"
  type        = map(string)
  default = {
    Name        = "main-vpc"
    Environment = "dev"
  }
}

variable "create_internet_gateway" {
  type    = bool
  default = true
}

# Subnet Variables
variable "subnet_tags" {
  description = "Etiquetas para la subnet"
  type        = map(string)
  default = {
    Name        = "public-subnet-1"
    Environment = "dev"
  }
}

# EC2 Variables
variable "ec2_ami" {
  description = "AMI para la instancia EC2"
  type        = string
  default     = "ami-00bd8e8e823b4e7f9"
}

variable "ec2_instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "ec2_key_name" {
  description = "Nombre del Key Pair a usar para la instancia EC2"
  type        = string
  default     = "test-key-name"
}

variable "public_key_path" {
  description = "Ruta al archivo que contiene tu clave pública"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ec2_tags" {
  description = "Etiquetas para la instancia EC2"
  type        = map(string)
  default = {
    Name        = "demo-instance"
    Environment = "dev"
  }
}

# NSG Variables
variable "name" {
  type        = string
  description = "The name of the security group"
  default     = "eks-security-group"
}

variable "description" {
  type        = string
  description = "Description of the security group"
  default     = "Security group for EKS"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where the security group will be created"
  default     = ""
}

variable "cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for the ingress rules"
  default     = ["10.0.0.0/16"]
}

variable "tags" {
  type        = map(string)
  description = "Tags for the security group"
  default     = { Name = "eks-private-security-group" }
}

variable "security_group_name" {
  description = "El nombre del grupo de seguridad"
  type        = string
  default     = "eks-private-security-group"
}

variable "security_group_description" {
  description = "Descripción del grupo de seguridad"
  type        = string
  default     = "EKS Private Security Group"
}

variable "security_group_cidr_blocks" {
  description = "Rango CIDR para el tráfico permitido"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "security_group_tags" {
  description = "Etiquetas para el grupo de seguridad"
  type        = map(string)
  default = {
    Name = "eks-private-security-group"
  }
}

variable "subnet_ids" {
  description = "IDs de las subnets donde se desplegará el Load Balancer"
  type        = list(string)
  default     = []
}

# Subnet CIDRs
variable "subnet_cidr_block" {
  description = "CIDR block para la subred"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr_block" {
  description = "CIDR block para la segunda subred"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet2_tags" {
  description = "Etiquetas para la segunda subnet"
  type        = map(string)
  default = {
    Name = "subnet-b"
  }
}

variable "security_group_vpc_id" {
  description = "ID de la VPC para el grupo de seguridad"
  type        = string
  default     = ""
}

