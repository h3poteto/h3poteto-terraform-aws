resource "aws_security_group" "security_group" {
  name        = "db-${var.db_identifier}-security-group"
  description = "RDS security group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port       = "${var.db_port}"
    to_port         = "${var.db_port}"
    protocol        = "tcp"
    security_groups = ["${var.app_security_group_ids}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "db-${var.db_identifier}-security-group"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
