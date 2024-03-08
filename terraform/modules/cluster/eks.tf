module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.5.2"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = true
  create_cloudwatch_log_group    = false

  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

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
