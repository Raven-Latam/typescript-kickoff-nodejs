output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "nlb_dns_name" {
  description = "DNS name of the internal NLB"
  value       = aws_lb.nlb.dns_name
}

output "api_endpoint" {
  description = "Invoke URL for the API Gateway HTTP API"
  value       = aws_apigatewayv2_api.this.api_endpoint
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.this.name
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.hello.name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository for the hello image"
  value       = aws_ecr_repository.typescript_kickoff.repository_url
}
