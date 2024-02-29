module "gateway" {
  source = "./modules/gateway"

  region       = var.region
  cluster_name = var.cluster_name

  vpc_id = var.vpc_id

  listner_arn = var.listner_arn

  private_subnet_1a = var.private_subnet_1a
  private_subnet_1b = var.private_subnet_1b
  private_subnet_1c = var.private_subnet_1c
}
