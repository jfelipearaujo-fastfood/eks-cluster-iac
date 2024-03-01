variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "eks_cluster" {
  description = "EKS Cluster"
}

variable "nodes_instances_sizes" {
  type        = list(string)
  description = "The instance types to use for the nodes"
}

variable "auto_scale_options" {
  type = object({
    min     = number
    max     = number
    desired = number
  })
  description = "The default options for auto scaling the nodes"
}

# variable "auto_scale_cpu_up" {
#   type = object({
#     threshold          = number
#     period             = number
#     evaluation_periods = number
#     cooldown           = number
#     scaling_adjustment = number
#   })
# }

# variable "auto_scale_cpu_down" {
#   type = object({
#     threshold          = number
#     period             = number
#     evaluation_periods = number
#     cooldown           = number
#     scaling_adjustment = number
#   })
# }

variable "private_subnet_1a" {
  type        = string
  description = "The private subnet 1a"
}

variable "private_subnet_1b" {
  type        = string
  description = "The private subnet 1b"
}

variable "private_subnet_1c" {
  type        = string
  description = "The private subnet 1c"
}
