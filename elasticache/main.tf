resource "aws_security_group" "elasticache_security_group" {
  vpc_id = var.vpc_id
  name        = "public_sg"
  description = "Security group for public access"
  ingress {
    from_port        = 6379
    to_port          = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_subnet_group" "elasticache_subnet" {
  name       = "ElasticacheSubnetGroup"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "example" {
  automatic_failover_enabled    = var.automatic_failover
  replication_group_id          = var.replication_group_id
  replication_group_description = "test description"
  node_type                     = var.node_type
  number_cache_clusters         = var.elasticache_replicas_count
  engine_version                = var.engine_version
  parameter_group_name          = var.parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.elasticache_subnet.name
  security_group_ids            = [aws_security_group.elasticache_security_group.id]
  port                          = 6379
}
