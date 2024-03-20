data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name
}

module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.20.0"

  allow_self_assume_role     = false
  assume_role_condition_test = "StringEquals"
  create_role                = true
  force_detach_policies      = true
  role_name                  = "irsa-${data.aws_eks_cluster.eks_cluster.name}"
  role_policy_arns = {
    policy = aws_iam_policy.bucket_policy.arn
  }

  oidc_providers = {
    (data.aws_eks_cluster.eks_cluster.name) : {
      provider_arn               = "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${replace(data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer, "https://", "")}"
      namespace_service_accounts = ["${var.namespace}:${var.service_account_name}"]
    }
  }

  depends_on = [
    aws_iam_policy.bucket_policy
  ]
}
