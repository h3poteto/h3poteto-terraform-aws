/*
 EKS cluster
*/
resource "aws_security_group" "base_master" {
  name        = "${var.namespace}-master-${var.env}"
  description = "EKS master security group"

  vpc_id = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.namespace}-master-${var.env}"
  }
}

resource "aws_security_group" "base_node" {
  name        = "${var.namespace}-node-${var.env}"
  description = "EKS node security group"

  vpc_id = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow internet facing LB, internal LB, and control plane"
    from_port   = 1025
    to_port     = 65535
    protocol    = "tcp"

    security_groups = [
      "${aws_security_group.external_lb.id}",
      "${aws_security_group.internal_lb.id}",
      "${aws_security_group.base_master.id}",
    ]
  }

  ingress {
    description = "Allow internet facing LB, internal LB, and control plane"
    from_port   = 1025
    to_port     = 65535
    protocol    = "udp"

    security_groups = [
      "${aws_security_group.external_lb.id}",
      "${aws_security_group.internal_lb.id}",
      "${aws_security_group.base_master.id}",
    ]
  }

  ingress {
    description = "Allow inter pods communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.namespace}-node-${var.env}"
  }
}

resource "aws_security_group" "external_lb" {
  name        = "${var.namespace}-external-lb-${var.env}"
  description = "EKS internet facing LB security group"

  vpc_id = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.namespace}-external-lb-${var.env}"
  }
}

resource "aws_security_group" "internal_lb" {
  name        = "${var.namespace}-internal-lb-${var.env}"
  description = "EKS internal LB security group"

  vpc_id = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.namespace}-internal-lb-${var.env}"
  }
}

/*
 DB
*/
resource "aws_security_group" "mysql_security_group" {
  name        = "${var.namespace}-db-${var.env}-mysql"
  description = "RDS security group"
  vpc_id      = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  ingress {
    from_port = "3306"
    to_port   = "3306"
    protocol  = "tcp"

    security_groups = [
      "${aws_security_group.base_node.id}",
      "sg-20c0ac58",
    ] # base-default-prd-instance; which is a security group for ECS Clusters.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "${var.namespace}-db-${var.env}-mysql"
    namespace = "${var.namespace}"
    role      = "db"
    env       = "${var.env}"
    tfstate   = "${var.tfstate}"
  }
}

resource "aws_security_group" "postgres_security_group" {
  name        = "${var.namespace}-db-${var.env}-postgres"
  description = "RDS security group"
  vpc_id      = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  ingress {
    from_port = "5432"
    to_port   = "5432"
    protocol  = "tcp"

    security_groups = [
      "${aws_security_group.base_node.id}",
      "sg-20c0ac58",
    ] # base-default-prd-instance; which is a security group for ECS Clusters.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "${var.namespace}-db-${var.env}-postgres"
    namespace = "${var.namespace}"
    role      = "db"
    env       = "${var.env}"
    tfstate   = "${var.tfstate}"
  }
}
