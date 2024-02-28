terraform {
  required_version = "1.7.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }

  backend "s3" {
    region = "us-east-1"
    key    = "terraform/eks/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = var.tags
  }
}

provider "kubernetes" {
  host                   = module.eks_cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks_cluster.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks_cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster.cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}
