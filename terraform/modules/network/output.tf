output "cluster_vpc" {
  value = aws_vpc.cluster_vpc
}

output "private_subnet_1a" {
  value = aws_subnet.private_a
}

output "private_subnet_1b" {
  value = aws_subnet.private_b
}

output "public_subnet_1a" {
  value = aws_subnet.public_a
}

output "public_subnet_1b" {
  value = aws_subnet.public_b
}
