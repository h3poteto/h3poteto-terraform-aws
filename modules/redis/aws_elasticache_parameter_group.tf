resource "aws_elasticache_parameter_group" "parameter_group" {
  name   = "redis32-${var.service}-${var.env}"
  family = "redis3.2"

  parameter {
    name  = "activerehashing"
    value = "${var.activerehashing}"
  }

  parameter {
    name  = "slowlog-log-slower-than"
    value = "${var.slowlog_log_slower_than}"
  }

  parameter {
    name  = "slowlog-max-len"
    value = "${var.slowlog_max_len}"
  }
}
