variable "region" {
  type        = string
  description = "The default region to use for AWS"
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "kubernetes_version" {
  type        = string
  description = "The version of Kubernetes to use for the EKS cluster"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "private_subnet_1a" {
  type        = string
  description = "The ID of the private subnet in the first availability zone"
}

variable "private_subnet_1b" {
  type        = string
  description = "The ID of the private subnet in the second availability zone"
}

variable "private_subnet_1c" {
  type        = string
  description = "The ID of the private subnet in the third availability zone"
}

variable "public_subnet_1a" {
  type        = string
  description = "The ID of the public subnet in the first availability zone"
}

variable "public_subnet_1b" {
  type        = string
  description = "The ID of the public subnet in the second availability zone"
}

variable "public_subnet_1c" {
  type        = string
  description = "The ID of the public subnet in the third availability zone"
}
