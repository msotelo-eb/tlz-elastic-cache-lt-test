resource "aws_elasticache_replication_group" "example" {
  automatic_failover_enabled    = true
  availability_zones            = [join("", [var.aws_region, "a"]), join("", [var.aws_region, "b"])]
  replication_group_id          = "tf-rep-group-1"
  replication_group_description = "test description"
  node_type                     = "cache.t2.micro"
  number_cache_clusters         = 2
  engine_version                = "3.2.10"
  parameter_group_name          = "default.redis3.2"
  port                          = 6379
}
