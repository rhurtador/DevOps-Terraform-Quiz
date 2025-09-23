terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = "default"
}

resource "aws_instance" "main" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.main.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = var.ec2_tags
}
