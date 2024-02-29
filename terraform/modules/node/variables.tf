variable "cluster_name" {}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(any)
}

variable "desired_size" {}

variable "max_size" {}

variable "min_size" {}
