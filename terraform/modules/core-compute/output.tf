output "vpc_id" {
  value = aws_vpc.vpc_drs.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "instance_id" {
  value = aws_instance.ec2_ubuntu.id
}

output "instance_web_id" {
  value = aws_instance.ec2_ubuntu_pub.id
}

output "security_group_id" {
  value = aws_security_group.traffic_allowed.id
}

