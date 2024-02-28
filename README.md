# fast-food-k8s-cluster

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.38.0 |
## Providers

No providers.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket to store the tfstate file | `any` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | `"fastfood"` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | The desired number of nodes in the node group | `number` | `1` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of Kubernetes to use | `string` | `"1.29"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The maximum number of nodes in the node group | `number` | `5` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | The minimum number of nodes in the node group | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | The default region to use for AWS | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to use for AWS resources | `map(string)` | <pre>{<br>  "App": "database"<br>}</pre> | no |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/eks_cluster | n/a |
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | ./modules/load_balancer | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
## Resources

No resources.
## Outputs

No outputs.


<br/><br/><br/>

# module\_eks\_cluster
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

No providers.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `any` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | VPC Private Subnets which EKS cluster is deployed in | `list(any)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `any` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 20.4.0 |
## Resources

No resources.
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Base64 encoded certificate data required to communicate with the cluster |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint for the EKS Kubernetes API |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the EKS cluster |
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | The ARN of the OIDC Provider if `enable_irsa = true` |
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.5.2 |
## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.5.2 |
## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.5.2 |
## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.5.2 |
## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.5.2 |
## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_subnet.eks_subnet_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.eks_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_1a"></a> [private\_subnet\_1a](#output\_private\_subnet\_1a) | n/a |
| <a name="output_private_subnet_1b"></a> [private\_subnet\_1b](#output\_private\_subnet\_1b) | n/a |
| <a name="output_private_subnet_1c"></a> [private\_subnet\_1c](#output\_private\_subnet\_1c) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_node
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `any` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `any` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1c"></a> [private\_subnet\_1c](#input\_private\_subnet\_1c) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_node_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_subnet.eks_subnet_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.eks_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_1a"></a> [private\_subnet\_1a](#output\_private\_subnet\_1a) | n/a |
| <a name="output_private_subnet_1b"></a> [private\_subnet\_1b](#output\_private\_subnet\_1b) | n/a |
| <a name="output_private_subnet_1c"></a> [private\_subnet\_1c](#output\_private\_subnet\_1c) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->

<br/><br/><br/>

# module\_node
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `any` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `any` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1c"></a> [private\_subnet\_1c](#input\_private\_subnet\_1c) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_node_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_subnet.eks_subnet_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.eks_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_1a"></a> [private\_subnet\_1a](#output\_private\_subnet\_1a) | n/a |
| <a name="output_private_subnet_1b"></a> [private\_subnet\_1b](#output\_private\_subnet\_1b) | n/a |
| <a name="output_private_subnet_1c"></a> [private\_subnet\_1c](#output\_private\_subnet\_1c) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->

# module\_node
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `any` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `any` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1c"></a> [private\_subnet\_1c](#input\_private\_subnet\_1c) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_node_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

# module\_load\_balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

# module\_network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_subnet.eks_subnet_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.eks_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_1a"></a> [private\_subnet\_1a](#output\_private\_subnet\_1a) | n/a |
| <a name="output_private_subnet_1b"></a> [private\_subnet\_1b](#output\_private\_subnet\_1b) | n/a |
| <a name="output_private_subnet_1c"></a> [private\_subnet\_1c](#output\_private\_subnet\_1c) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->

# module\_node
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `any` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `any` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1c"></a> [private\_subnet\_1c](#input\_private\_subnet\_1c) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_node_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

---
# Module: Load Balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

---
# Module: Network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_subnet.eks_subnet_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.eks_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_1a"></a> [private\_subnet\_1a](#output\_private\_subnet\_1a) | n/a |
| <a name="output_private_subnet_1b"></a> [private\_subnet\_1b](#output\_private\_subnet\_1b) | n/a |
| <a name="output_private_subnet_1c"></a> [private\_subnet\_1c](#output\_private\_subnet\_1c) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->

---
# Module: Node
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `any` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `any` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1c"></a> [private\_subnet\_1c](#input\_private\_subnet\_1c) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_node_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->

# Module: Load Balancer
<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN used for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID which Load balancers will be  deployed in | `string` | n/a | yes |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |
## Resources

| Name | Type |
|------|------|
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->

# Module: Network
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_subnet.eks_subnet_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_subnet_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.eks_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_1a"></a> [private\_subnet\_1a](#output\_private\_subnet\_1a) | n/a |
| <a name="output_private_subnet_1b"></a> [private\_subnet\_1b](#output\_private\_subnet\_1b) | n/a |
| <a name="output_private_subnet_1c"></a> [private\_subnet\_1c](#output\_private\_subnet\_1c) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->

# Module: Node
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `any` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `any` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1a"></a> [private\_subnet\_1a](#input\_private\_subnet\_1a) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1b"></a> [private\_subnet\_1b](#input\_private\_subnet\_1b) | n/a | `any` | n/a | yes |
| <a name="input_private_subnet_1c"></a> [private\_subnet\_1c](#input\_private\_subnet\_1c) | n/a | `any` | n/a | yes |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_node_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->
## Outputs

No outputs.
<!-- END_TF_DOCS -->
## Resources

No resources.
## Outputs

No outputs.
<!-- END_TF_DOCS -->