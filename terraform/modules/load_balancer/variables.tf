variable "region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  description = "VPC ID which Load balancers will be  deployed in"
  type        = string
}

variable "oidc_provider_arn" {
  description = "OIDC Provider ARN used for IRSA "
  type        = string
}
