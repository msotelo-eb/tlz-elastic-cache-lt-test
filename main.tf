module "networking" {
  source           = "./networking"
  subnet_count  = 2
}

module "elasticache" {
  source = "./elasticache"
  vpc_id = module.networking.vpc_id
  subnet_ids = module.networking.subnet_ids
  elasticache_replicas_count = 2
}
