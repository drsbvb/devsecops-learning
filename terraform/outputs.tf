output "vpc_id" {
  description = "VPC id"
  value       = module.core_compute.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet ids"
  value       = module.core_compute.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet ids"
  value       = module.core_compute.private_subnet_ids
}

output "instance_id" {
  description = "Instance id"
  value       = module.core_compute.instance_id
}

output "instance_web_id" {
  description = "Instance Web id"
  value       = module.core_compute.instance_web_id
}

output "security_group_id" {
  description = "Security group id"
  value       = module.core_compute.security_group_id
}

output "eks_cluster_id" {
  description = "EKS Cluster id"
  value       = aws_eks_cluster.eks_cluster.id
}
output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}
