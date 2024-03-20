variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "namespace" {
  description = "The namespace of the service account"
  type        = string
}

variable "service_account_name" {
  description = "The name of the service account"
  type        = string
}