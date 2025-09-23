# DevOps Terraform Quiz - Infrastructure as Code

Este repositorio contiene la infraestructura completa de AWS usando Terraform con módulos reutilizables.

## 🏗️ Arquitectura

- **VPC** con Internet Gateway y Route Tables públicas
- **Subnets** en múltiples AZs para alta disponibilidad
- **EC2** con Security Groups y Key Pairs
- **EKS** cluster con IAM roles y Node Groups
- **Load Balancer** (configuración lista)

## 📁 Estructura del Proyecto

```
├── main.tf                 # Configuración principal
├── variables.tf           # Variables globales
├── outputs.tf            # Outputs del cluster EKS
├── eks.tf               # Configuración EKS
├── providers/
│   └── provider.tf       # Configuración de providers
└── modules/
    ├── vpc/             # Módulo VPC
    ├── subnet/          # Módulo Subnet
    ├── ec2/             # Módulo EC2
    ├── nsg/             # Módulo Security Groups
    └── loadbalancer/    # Módulo Load Balancer
```

## 🚀 Configuración Inicial

### 1. Configurar Secrets en GitHub

Ve a tu repositorio → Settings → Secrets and variables → Actions

Agrega estos secrets:

- `AWS_ACCESS_KEY_ID`: Access Key del usuario terraform
- `AWS_SECRET_ACCESS_KEY`: Secret Key del usuario terraform

### 2. Configurar Variables de Terraform

Edita `terraform.tfvars` con tus valores:

```hcl
# VPC Configuration
vpc_cidr_block = "10.0.0.0/16"
vpc_tags = {
  Name = "main-vpc"
  Environment = "dev"
}

# Subnet Configuration
subnet_cidr_block = "10.0.1.0/24"
subnet_tags = {
  Name = "public-subnet-1"
  Environment = "dev"
}

subnet2_cidr_block = "10.0.2.0/24"
subnet2_tags = {
  Name = "public-subnet-2"
  Environment = "dev"
}

# EC2 Configuration
ec2_ami = "ami-0c02fb55956c7d316"  # Amazon Linux 2
ec2_instance_type = "t3.micro"
ec2_tags = {
  Name = "demo-instance"
  Environment = "dev"
}

# Security Groups
ec2_security_group_name = "ec2-sg"
ec2_security_group_description = "Security group for EC2 instances"
security_group_tags = {
  Name = "ec2-security-group"
  Environment = "dev"
}
```

## 🔧 Uso Local

```bash
# Inicializar Terraform
terraform init

# Verificar configuración
terraform validate

# Ver plan de cambios
terraform plan

# Aplicar cambios
terraform apply

# Destruir infraestructura
terraform destroy
```

## 🤖 GitHub Actions

### Workflows Disponibles:

1. **Terraform CI** - Validación automática en cada push
2. **Terraform Deploy** - Despliegue manual con opciones

### Ejecutar Manualmente:

1. Ve a Actions en GitHub
2. Selecciona el workflow
3. Click "Run workflow"
4. Selecciona ambiente y acción

## 🔐 Permisos IAM Requeridos

El usuario `terraform` necesita estos permisos:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:*",
                "eks:*",
                "iam:*",
                "vpc:*",
                "elasticloadbalancing:*"
            ],
            "Resource": "*"
        }
    ]
}
```

## 📊 Outputs

Después del despliegue, obtendrás:

- `eks_cluster_name`: Nombre del cluster EKS
- `eks_cluster_endpoint`: Endpoint del cluster
- `eks_oidc_issuer`: OIDC issuer para IRSA

## 🔗 Conectar a EKS

```bash
# Configurar kubectl
aws eks update-kubeconfig --region eu-west-1 --name demo-eks

# Verificar conexión
kubectl get nodes
```

## 🆘 Troubleshooting

### Error de permisos:
- Verifica que el usuario terraform tenga los permisos necesarios
- Revisa que los secrets estén configurados correctamente

### Error de recursos:
- Verifica que la región `eu-west-1` tenga los recursos disponibles
- Revisa los límites de tu cuenta AWS

## 📝 Notas

- Account ID: `183295428965`
- Región: `eu-west-1`
- Usuario IAM: `terraform`