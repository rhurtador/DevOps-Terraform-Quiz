output "lb_arn" {
  description = "ARN del Load Balancer"
  value       = aws_lb.eks_nlb.arn
}

output "lb_dns_name" {
  description = "DNS del Load Balancer"
  value       = aws_lb.eks_nlb.dns_name
}
