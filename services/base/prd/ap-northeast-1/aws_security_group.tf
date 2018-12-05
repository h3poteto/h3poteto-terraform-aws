resource "aws_security_group" "mysql_security_group" {
  name        = "${var.service}-${var.role}-${var.env}-mysql"
  description = "RDS security group"
  vpc_id      = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  ingress {
    from_port       = "3306"
    to_port         = "3306"
    protocol        = "tcp"
    security_groups = ["${module.ecs_cluster.instance_security_group_id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "${var.service}-${var.role}-${var.env}-mysql"
    service = "${var.service}"
    role    = "${var.role}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}

resource "aws_security_group" "postgres_security_group" {
  name        = "${var.service}-${var.role}-${var.env}-postgres"
  description = "RDS security group"
  vpc_id      = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  ingress {
    from_port       = "5432"
    to_port         = "5432"
    protocol        = "tcp"
    security_groups = ["${module.ecs_cluster.instance_security_group_id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "${var.service}-${var.role}-${var.env}-postgres"
    service = "${var.service}"
    role    = "${var.role}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
