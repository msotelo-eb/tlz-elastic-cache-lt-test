module "networking" {
  source           = "./networking"
  subnet_count  = 2
}

module "elasticache" {
  source = "./elasticache"
  vpc_id = module.networking.vpc_id
  subnet_ids = module.networking.subnet_ids
  elasticache_replicas_count = 1
  elasticache_shard_count =2
}

resource "aws_cloud9_environment_ec2" "example" {
  instance_type = "t2.micro"
  name          = "example-env"
  subnet_id = module.networking.subnet_ids[0]
}
