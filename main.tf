data "aws_availability_zones" "available" {}

resource "random_shuffle" "availability_zones_list" {
  input        = data.aws_availability_zones.available.names
  result_count = var.elasticache_desired_clusters
}

resource "aws_elasticache_replication_group" "example" {
  automatic_failover_enabled    = true
  availability_zones            = random_shuffle.availability_zones_list.result
  replication_group_id          = "tf-rep-group-1"
  replication_group_description = "test description"
  node_type                     = "cache.t2.micro"
  number_cache_clusters         = var.elasticache_desired_clusters
  engine_version                = "3.2.10"
  parameter_group_name          = "default.redis3.2"
  port                          = 6379
}
