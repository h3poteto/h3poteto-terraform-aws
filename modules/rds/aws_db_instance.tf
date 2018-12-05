resource "aws_db_instance" "db_instance" {
  identifier              = "${var.db_identifier}"
  engine                  = "${var.db_instance_engine}"
  engine_version          = "${var.db_instance_engine_version}"
  instance_class          = "${var.db_instance_instance_class}"
  storage_type            = "${var.db_instance_storage_type}"
  iops                    = "${var.db_instance_iops}"
  allocated_storage       = "${var.db_instance_allocated_storage}"
  multi_az                = "${var.db_instance_multi_az}"
  port                    = "${var.db_port}"
  username                = "${var.db_username}"
  password                = "${var.db_password}"
  publicly_accessible     = false
  backup_retention_period = 7
  backup_window           = "20:00-20:30"
  maintenance_window      = "Sat:19:00-Sat:20:00"

  vpc_security_group_ids = ["${aws_security_group.security_group.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.db_subnet_group.name}"
  parameter_group_name   = "${var.db_instance_parameter_group}"

  tags {
    Name    = "${var.db_identifier}-db-instance"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }

  lifecycle {
    ignore_changes = ["password"]
  }
}
