# Fast-Food k8s Cluster

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
| <a name="input_auto_scale_cpu"></a> [auto\_scale\_cpu](#input\_auto\_scale\_cpu) | n/a | `map` | <pre>{<br>  "scale_down_cooldown": 300,<br>  "scale_down_evaluation": 2,<br>  "scale_down_period": 120,<br>  "scale_down_remove": -1,<br>  "scale_down_threshold": 40,<br>  "scale_up_add": 2,<br>  "scale_up_cooldown": 300,<br>  "scale_up_evaluation": 2,<br>  "scale_up_period": 60,<br>  "scale_up_threshold": 80<br>}</pre> | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket to store the tfstate file | `any` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | `"fastfood"` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | The desired number of nodes in the node group | `number` | `1` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of Kubernetes to use | `string` | `"1.29"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The maximum number of nodes in the node group | `number` | `5` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | The minimum number of nodes in the node group | `number` | `1` | no |
| <a name="input_nodes_instances_sizes"></a> [nodes\_instances\_sizes](#input\_nodes\_instances\_sizes) | n/a | `list` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The default region to use for AWS | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to use for AWS resources | `map(string)` | <pre>{<br>  "App": "database"<br>}</pre> | no |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/eks_cluster | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_node"></a> [node](#module\_node) | ./modules/node | n/a |
## Resources

No resources.
## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Modules

- [eks_cluster](./docs/eks_cluster.md)
- [network](./docs/network.md)
- [node](./docs/node.md)