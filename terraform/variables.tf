variable "region" {
  description = "The default region to use for AWS"
  default     = "us-east-1"
}

variable "tags" {
  description = "The default tags to use for AWS resources"
  type        = map(string)
  default = {
    App = "database"
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

variable "desired_size" {
  description = "The desired number of nodes in the node group"
  default     = 1
}

variable "min_size" {
  description = "The minimum number of nodes in the node group"
  default     = 1
}

variable "max_size" {
  description = "The maximum number of nodes in the node group"
  default     = 5
}
