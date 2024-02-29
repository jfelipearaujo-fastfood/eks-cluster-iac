module "network" {
  source = "./modules/network"

  cluster_name = var.cluster_name
  region       = var.region
}

module "eks_cluster" {
  source = "./modules/eks_cluster"

  region = var.region

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  vpc_id             = module.network.cluster_vpc.id

  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b
  private_subnet_1c = module.network.private_subnet_1c

  public_subnet_1a = module.network.public_subnet_1a
  public_subnet_1b = module.network.public_subnet_1b
  public_subnet_1c = module.network.public_subnet_1c
}

# module "node" {
#   source = "./modules/node"

#   cluster_name = var.cluster_name
#   eks_cluster  = module.eks_cluster.eks_cluster

#   nodes_instances_sizes = var.nodes_instances_sizes
#   auto_scale_options    = var.auto_scale_options

#   auto_scale_cpu_up   = var.auto_scale_cpu_up
#   auto_scale_cpu_down = var.auto_scale_cpu_down

#   private_subnet_1a = module.network.private_subnet_1a
#   private_subnet_1b = module.network.private_subnet_1b
# }
