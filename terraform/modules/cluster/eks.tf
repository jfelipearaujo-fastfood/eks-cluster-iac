module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.5.2"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = true
  create_cloudwatch_log_group    = false

  enable_cluster_creator_admin_permissions = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  eks_managed_node_groups = {
    group = {
      name           = "workers"
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 5
      desired_size = 1
    }
  }
}

resource "kubernetes_namespace_v1" "namespace" {
  metadata {
    name = var.cluster_namespace
  }

  depends_on = [
    module.eks
  ]
}

resource "aws_iam_role" "service_account_role" {
  name = "${var.cluster_name}-service-account-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = module.eks.oidc_provider_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${module.eks.oidc_provider}:aud" : "sts.amazonaws.com",
            "${module.eks.oidc_provider}:sub" : "system:serviceaccount:${var.cluster_namespace}:${var.cluster_service_account_name}"
          }
        }
      },
    ]
  })
}
