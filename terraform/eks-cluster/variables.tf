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

# variable "nodes_instances_sizes" {
#   default = [
#     "t3.medium"
#   ]
# }

# variable "auto_scale_options" {
#   default = {
#     min     = 1
#     max     = 5
#     desired = 1
#   }
# }

# variable "auto_scale_cpu_up" {
#   description = "The default options for CPU scaling up"

#   type = object({
#     threshold          = number
#     period             = number
#     evaluation_periods = number
#     cooldown           = number
#     scaling_adjustment = number
#   })

#   default = {
#     // The value against which the specified statistic is compared
#     threshold = 80

#     // The period in seconds over which the specified statistic is applied
#     period = 60

#     // The number of periods over which data is compared to the specified threshold.
#     evaluation_periods = 1

#     // Amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start.
#     cooldown = 300

#     // Number of instances by which to scale
#     scaling_adjustment = 1
#   }
# }

# variable "auto_scale_cpu_down" {
#   description = "The default options for CPU scaling down"

#   type = object({
#     threshold          = number
#     period             = number
#     evaluation_periods = number
#     cooldown           = number
#     scaling_adjustment = number
#   })

#   default = {
#     // The value against which the specified statistic is compared
#     threshold = 40

#     // The period in seconds over which the specified statistic is applied
#     period = 120

#     // The number of periods over which data is compared to the specified threshold.
#     evaluation_periods = 1

#     // Amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start.
#     cooldown = 300

#     // Number of instances by which to scale
#     scaling_adjustment = -1
#   }
# }
