output "elasticache_primary_endpoint" {
  value = aws_elasticache_replication_group.example.primary_endpoint_address
}

output "elasticache_reader_endpoint" {
  value = aws_elasticache_replication_group.example.reader_endpoint_address
}