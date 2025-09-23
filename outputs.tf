output "vpc_id" {
  value = module.private_vpc.vpc_id
}

output "subnet_id" {
  value = module.subnet.subnet_id
}

output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}

output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}
