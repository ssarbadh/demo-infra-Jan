output "vpc" {
  description = "VPC output"
  value       = aws_vpc.main.id
}

output "dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.demo_infra_alb.dns_name
}
