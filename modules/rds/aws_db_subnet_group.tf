resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "db-${var.db_identifier}-db-subnet-group"
  description = "RDS subnet group"
  subnet_ids  = ["${var.subnet_1_id}", "${var.subnet_2_id}"]

  tags {
    Name    = "${var.db_identifier}-db-subnet-group"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
