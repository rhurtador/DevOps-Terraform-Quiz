# Primera Subnet en AZ1
module "subnet" {
  source         = "./modules/subnet"
  vpc_id         = module.private_vpc.vpc_id
  cidr_block     = var.subnet_cidr_block
  subnet_tags    = var.subnet_tags
  route_table_id = module.private_vpc.public_route_table_id
  availability_zone = "eu-west-1a"
}

# Segunda Subnet en AZ2
module "subnet_b" {
  source         = "./modules/subnet"
  vpc_id         = module.private_vpc.vpc_id
  cidr_block     = var.subnet2_cidr_block
  subnet_tags    = var.subnet2_tags
  route_table_id = module.private_vpc.public_route_table_id
  availability_zone = "eu-west-1b"
}

# Crear la EC2
module "ec2_instance" {
  source             = "./modules/ec2"
  ami_id             = var.ec2_ami
  instance_type      = var.ec2_instance_type
  ec2_key_name       = var.ec2_key_name
  subnet_id          = module.subnet.subnet_id
  public_key_path    = var.public_key_path
  security_group_ids = [module.ec2_sg.security_group_id]
  ec2_tags           = var.ec2_tags
}


# Crear la VPC
module "private_vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_tags       = var.vpc_tags
}

# Security Group para EC2 (SSH/HTTP)
module "ec2_sg" {
  source                     = "./modules/nsg"
  security_group_name        = var.ec2_security_group_name
  security_group_description = var.ec2_security_group_description
  security_group_vpc_id      = module.private_vpc.vpc_id
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Permitir SSH"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Permitir HTTP"
    }
  ]
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Permitir todo saliente"
    }
  ]
  tags = var.security_group_tags
}



# El módulo de Load Balancer queda deshabilitado hasta que definamos sus dependencias explícitas
# module "eks_lb" {
#   source           = "./modules/loadbalancer"
#   name             = var.load_balancer_name
#   internal         = var.internal
#   security_groups  = [module.ec2_sg.security_group_id]
#   subnets          = [module.subnet.subnet_id]
#   lb_tags          = var.lb_tags
# }

