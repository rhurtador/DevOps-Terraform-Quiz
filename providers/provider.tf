# Configuración del proveedor de AWS
provider "aws" {
  region  = "eu-west-1" # Especifica la región
  profile = "default"   # Perfil de AWS CLI (puedes cambiarlo a un perfil específico)
}

# Los proveedores de kubernetes/helm se configurarán opcionalmente desde el módulo de EKS