variable "tags" {
  type        = map(string)
  description = "The default tags to use for AWS resources"
  default = {
    App = "api-gateway"
  }
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to store the tfstate file"
}

variable "region" {
  type        = string
  description = "The default region to use for AWS"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "listner_arn" {
  type        = string
  description = "ARN of the Load Balancer listener"
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
