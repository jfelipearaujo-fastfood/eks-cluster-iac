# Module EKS Cluster

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of Kubernetes to use for the EKS cluster | `string` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | The ID of the private subnet in the first availability zone | `string` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | The ID of the private subnet in the second availability zone | `string` | n/a | yes |
| <a name="input_private_subnet_1c"></a> [private\_subnet\_1c](#input\_private\_subnet\_1c) | The ID of the private subnet in the third availability zone | `string` | n/a | yes |
| <a name="input_public_subnet_1a"></a> [public\_subnet\_1a](#input\_public\_subnet\_1a) | The ID of the public subnet in the first availability zone | `string` | n/a | yes |
| <a name="input_public_subnet_1b"></a> [public\_subnet\_1b](#input\_public\_subnet\_1b) | The ID of the public subnet in the second availability zone | `string` | n/a | yes |
| <a name="input_public_subnet_1c"></a> [public\_subnet\_1c](#input\_public\_subnet\_1c) | The ID of the public subnet in the third availability zone | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The default region to use for AWS | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_allow_assume_eks_admins_iam_policy"></a> [allow\_assume\_eks\_admins\_iam\_policy](#module\_allow\_assume\_eks\_admins\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.35.0 |
| <a name="module_allow_eks_access_iam_policy"></a> [allow\_eks\_access\_iam\_policy](#module\_allow\_eks\_access\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.35.0 |
| <a name="module_eks_admins_iam_group"></a> [eks\_admins\_iam\_group](#module\_eks\_admins\_iam\_group) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | 5.35.0 |
| <a name="module_eks_admins_iam_role"></a> [eks\_admins\_iam\_role](#module\_eks\_admins\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.35.0 |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | terraform-aws-modules/eks/aws | 20.4.0 |
## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-load-balancer-controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.cluster_master_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_ingress_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_iam_policy_document.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_user.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster"></a> [eks\_cluster](#output\_eks\_cluster) | values for the EKS cluster |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | values for the security group |
<!-- END_TF_DOCS -->