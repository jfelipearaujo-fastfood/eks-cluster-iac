module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.4.0"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  cluster_endpoint_public_access           = false
  enable_cluster_creator_admin_permissions = true

  iam_role_arn = aws_iam_role.eks_cluster_role.arn

  cluster_security_group_id = aws_security_group.cluster_master_sg.id

  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b,
    var.private_subnet_1c,
    var.public_subnet_1a,
    var.public_subnet_1b,
    var.public_subnet_1c
  ]

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

# resource "aws_eks_cluster" "eks_cluster" {
#   name     = var.cluster_name
#   version  = var.kubernetes_version
#   role_arn = aws_iam_role.eks_cluster_role.arn

#   vpc_config {
#     security_group_ids = [
#       aws_security_group.cluster_master_sg.id
#     ]

#     subnet_ids = [
#       var.private_subnet_1a,
#       var.private_subnet_1b,
#       var.private_subnet_1c,
#       var.public_subnet_1a,
#       var.public_subnet_1b,
#       var.public_subnet_1c
#     ]
#   }

#   tags = {
#     "kubernetes.io/cluster/${var.cluster_name}" = "shared"
#   }
# }
