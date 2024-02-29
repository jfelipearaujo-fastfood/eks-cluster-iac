module "network" {
  source = "./modules/network"

  cluster_name = var.cluster_name
  region       = var.region
}

module "eks_cluster" {
  source = "./modules/eks_cluster"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id          = module.network.vpc_id
  private_subnets = module.network.private_subnets
}

module "node" {
  source = "./modules/node"

  cluster_name = module.eks_cluster.cluster_name

  private_subnets = module.network.private_subnets

  desired_size = var.desired_size
  min_size     = var.min_size
  max_size     = var.max_size
}

module "load_balancer" {
  source = "./modules/load_balancer"

  cluster_name      = var.cluster_name
  region            = var.region
  vpc_id            = module.network.vpc_id
  oidc_provider_arn = module.eks_cluster.oidc_provider_arn
}
