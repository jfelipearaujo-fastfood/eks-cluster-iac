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

# variable "lb_arn" {
#   description = "The Load Balancer Listener ARN to use for the API Gateway integration"
# }

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
    "t3.medium"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 1
    max     = 5
    desired = 1
  }
}

variable "auto_scale_cpu" {
  default = {
    scale_up_threshold  = 80
    scale_up_period     = 60
    scale_up_evaluation = 1
    scale_up_cooldown   = 300
    scale_up_add        = 1

    scale_down_threshold  = 40
    scale_down_period     = 120
    scale_down_evaluation = 1
    scale_down_cooldown   = 300
    scale_down_remove     = -1
  }
}
