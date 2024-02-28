variable "cluster_name" {}

variable "vpc_id" {}

variable "kubernetes_version" {}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(any)
}
