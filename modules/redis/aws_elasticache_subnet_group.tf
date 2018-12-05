resource "aws_elasticache_subnet_group" "subnet_group" {
  name        = "redis32-${var.service}-${var.env}"
  description = "ElastiCache subnet group for Redis 3.2"

  subnet_ids = ["${var.subnet_1_id}", "${var.subnet_2_id}"]
}
