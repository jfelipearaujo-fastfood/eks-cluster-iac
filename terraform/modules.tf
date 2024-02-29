module "network" {
  source = "./modules/network"

  cluster_name = var.cluster_name
  region       = var.region
}

module "eks_cluster" {
  source = "./modules/eks_cluster"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  cluster_vpc        = module.network.cluster_vpc

  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b
  public_subnet_1a  = module.network.public_subnet_1a
  public_subnet_1b  = module.network.public_subnet_1b
}

module "node" {
  source = "./modules/node"

  cluster_name = var.cluster_name
  eks_cluster  = module.eks_cluster.eks_cluster

  nodes_instances_sizes = var.nodes_instances_sizes
  auto_scale_options    = var.auto_scale_options
  auto_scale_cpu        = var.auto_scale_cpu
  private_subnet_1a     = module.network.private_subnet_1a
  private_subnet_1b     = module.network.private_subnet_1b
}

# module "gateway" {
#   source = "./modules/gateway"

#   cluster_name      = var.cluster_name
#   lb_arn            = var.lb_arn
#   vpc_id            = module.network.cluster_vpc.id
#   private_subnet_1a = module.network.private_subnet_1a
#   private_subnet_1b = module.network.private_subnet_1b
# }
