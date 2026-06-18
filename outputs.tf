output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the created VPC"
}

output "security_group_id" {
    value = aws_security_group.main.id
}