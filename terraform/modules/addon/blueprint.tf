module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "1.16"

  cluster_name      = var.cluster_name
  cluster_version   = var.cluster_version
  cluster_endpoint  = var.cluster_endpoint
  oidc_provider_arn = var.oidc_provider_arn

  enable_metrics_server = true

  enable_aws_load_balancer_controller = true
  aws_load_balancer_controller = {
    set = [
      {
        name  = "vpcId",
        value = var.vpc_id
      },
      {
        name  = "podDisruptionBudget.maxUnavailable"
        value = 1
      },
    ]
  }
}
