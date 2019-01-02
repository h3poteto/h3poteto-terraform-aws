resource "aws_elasticache_subnet_group" "subnet_group" {
  name        = "redis-${var.service}-${var.env}"
  description = "ElastiCache subnet group for Redis"

  subnet_ids = ["${var.subnets}"]
}
