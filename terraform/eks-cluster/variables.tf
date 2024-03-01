variable "region" {
  description = "The default region to use for AWS"
  default     = "us-east-1"
}

variable "tags" {
  description = "The default tags to use for AWS resources"
  type        = map(string)
  default = {
    App = "eks-cluster"
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket to store the tfstate file"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "fastfood"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use"
  default     = "1.29"
}

variable "nodes_instances_sizes" {
  default = [
    "t2.micro"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 1
    max     = 5
    desired = 1
  }
}
