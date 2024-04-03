output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet1_id" {
  value = aws_subnet.PublicSubnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.PublicSubnet2.id
}

output "public_subnet3_id" {
  value = aws_subnet.PublicSubnet3.id
}

output "private_subnet1_id" {
  value = aws_subnet.PrivateSubnet1.id
}

output "private_subnet2_id" {
  value = aws_subnet.PrivateSubnet2.id
}

output "private_subnet3_id" {
  value = aws_subnet.PrivateSubnet3.id
}

output "public_subnets" {
  value = [
    aws_subnet.PublicSubnet1.id,
    aws_subnet.PublicSubnet2.id,
    aws_subnet.PublicSubnet3.id
  ]
}

output "private_subnets" {
  value = [
    aws_subnet.PrivateSubnet1.id,
    aws_subnet.PrivateSubnet2.id,
    aws_subnet.PrivateSubnet3.id
  ]
}