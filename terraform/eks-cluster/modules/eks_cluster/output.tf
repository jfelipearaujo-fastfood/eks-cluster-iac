output "eks_cluster" {
  description = "values for the EKS cluster"
  value       = aws_eks_cluster.eks_cluster
}

output "security_group" {
  description = "values for the security group"
  value       = aws_security_group.cluster_master_sg
}
