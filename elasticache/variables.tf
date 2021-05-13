variable "automatic_failover" {
  type = bool
  default = true
}

variable "replication_group_id" {
  type = string
  default = "tf-rep-group-1"
}

variable "node_type" {
  type = string
  default = "cache.t2.micro"
}

variable "engine_version" {
  type = string
  default = "3.2.10"
}

variable "parameter_group_name" {
  type = string
  default = "default.redis3.2.cluster.on"
}
variable "multi_az_enabled" {
  type = bool
  default = true
}

variable "maintenance_window" {
  type = string
  default =  "sun:05:00-sun:09:00"
}
# INPUT VARIABLES
variable "vpc_id" {
  type = string
  description = "VPC Id for Security Group"
}
variable "subnet_ids" {
  type = list(string)
  description = "Subnet Ids for ElastiCache Subnet Group"
}
variable "elasticache_replicas_count" {
  type = number
  description = "Quantity of replicas desired"
}

variable "elasticache_shard_count" {
  type = number
  description = "Quantity of shards desired"
}