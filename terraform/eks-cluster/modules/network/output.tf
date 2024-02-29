output "cluster_vpc" {
  description = "value of the VPC"
  value       = aws_vpc.cluster_vpc
}

output "private_subnet_1a" {
  description = "value of the private subnet in the first availability zone"
  value       = aws_subnet.private_a.id
}

output "private_subnet_1b" {
  description = "value of the private subnet in the second availability zone"
  value       = aws_subnet.private_b.id
}

output "private_subnet_1c" {
  description = "value of the private subnet in the third availability zone"
  value       = aws_subnet.private_c.id
}

output "public_subnet_1a" {
  description = "value of the public subnet in the first availability zone"
  value       = aws_subnet.public_a.id
}

output "public_subnet_1b" {
  description = "value of the public subnet in the second availability zone"
  value       = aws_subnet.public_b.id
}

output "public_subnet_1c" {
  description = "value of the public subnet in the third availability zone"
  value       = aws_subnet.public_c.id
}
