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

resource "aws_db_parameter_group" "postgres" {
  name   = "${var.namespace}-db-${var.env}-postgres10"
  family = "postgres10"

  parameter {
    name         = "max_connections"
    value        = "GREATEST({DBInstanceClassMemory/12582880}, 400)"
    apply_method = "pending-reboot"
  }
}
