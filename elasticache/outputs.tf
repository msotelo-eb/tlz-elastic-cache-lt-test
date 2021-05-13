output "elasticache_endpoint_address" {
  value = aws_elasticache_replication_group.example.configuration_endpoint_address
}