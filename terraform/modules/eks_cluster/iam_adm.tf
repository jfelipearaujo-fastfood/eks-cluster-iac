module "allow_eks_access_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.35.0"

  name          = "allow-eks-access-to-${var.cluster_name}"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "eks:DescribeCluster",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

data "aws_iam_user" "admin" {
  user_name = "admin"
}

module "eks_admins_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.35.0"

  role_name         = "eks-admin-${var.cluster_name}"
  create_role       = true
  role_requires_mfa = false

  custom_role_policy_arns = [module.allow_eks_access_iam_policy.arn]

  trusted_role_arns = [
    data.aws_iam_user.admin.arn
  ]
}

module "allow_assume_eks_admins_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.35.0"

  name          = "allow-assume-eks-admin-iam-role-for-${var.cluster_name}"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = module.eks_admins_iam_role.iam_role_arn
      },
    ]
  })
}

module "eks_admins_iam_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.35.0"

  name                              = "eks-admin-${var.cluster_name}"
  attach_iam_self_management_policy = false
  create_group                      = true
  custom_group_policy_arns          = [module.allow_assume_eks_admins_iam_policy.arn]
}
