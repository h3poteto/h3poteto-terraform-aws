resource "aws_db_parameter_group" "mysql57" {
  name   = "${var.namespace}-db-${var.env}-mysql57"
  family = "mysql5.7"

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_connection"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_results"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_connection"
    value = "utf8mb4_general_ci"
  }

  parameter {
    name  = "max_connections"
    value = "GREATEST({DBInstanceClassMemory/12582880}, 400)"
  }
}

resource "aws_db_parameter_group" "postgres11" {
  name   = "${var.namespace}-db-${var.env}-postgres11"
  family = "postgres11"

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "shared_buffers"
    value        = "{dbinstanceclassmemory/32768}"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "work_mem"
    value = "8388608"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "3000"
  }
}

