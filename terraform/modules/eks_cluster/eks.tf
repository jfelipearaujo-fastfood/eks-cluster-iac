module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.4.0"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  cluster_endpoint_public_access = true

  create_kms_key              = false
  create_cloudwatch_log_group = false
  cluster_encryption_config   = {}

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
    aws-ebs-csi-driver = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnets
  control_plane_subnet_ids = var.private_subnets

  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
    iam_role_additional_policies = {
      AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    }
  }

  enable_cluster_creator_admin_permissions = true

  authentication_mode = "API_AND_CONFIG_MAP"

  eks_managed_node_groups = {
    blue = {
      node_group_name = format("%s-blue-node-group", var.cluster_name)
      min_size        = 1
      max_size        = 10
      desired_size    = 1
    }
    green = {
      node_group_name = format("%s-green-node-group", var.cluster_name)
      min_size        = 1
      max_size        = 10
      desired_size    = 1

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    terraform = "true"
  }
}
