resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "${var.replication_group_id}"
  replication_group_description = "ElastiCache Redis 3.2 replication group for ${var.service} on ${var.env}"
  number_cache_clusters         = "${var.num_cache_clusters}"
  node_type                     = "${var.node_type}"
  engine                        = "redis"
  engine_version                = "${var.engine_version}"
  maintenance_window            = "${var.maintenace_window}"
  port                          = 6379
  parameter_group_name          = "${aws_elasticache_parameter_group.parameter_group.name}"
  subnet_group_name             = "${aws_elasticache_subnet_group.subnet_group.name}"
  security_group_ids            = ["${aws_security_group.security_group.id}"]
  availability_zones            = ["${var.availability_zones}"]
}
