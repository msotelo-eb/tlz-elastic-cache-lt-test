variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "elasticache_desired_clusters" {
  type = number
  default = 2
}
