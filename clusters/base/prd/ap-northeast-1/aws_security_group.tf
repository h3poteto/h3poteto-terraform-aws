resource "aws_security_group" "master_instance" {
  name        = "${var.namespace}-master-instance-${var.env}"
  description = "Kubernetes master instance"

  vpc_id = data.terraform_remote_state.aws_vpc_tokyo.outputs.vpc_id

  # For SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_from_cidr]
  }

  # Myself
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  # For node
  ingress {
    from_port = 4003
    to_port   = 65535
    protocol  = "tcp"

    security_groups = [
      aws_security_group.node_instance.id,
    ]
  }

  ingress {
    from_port = 2382
    to_port   = 4000
    protocol  = "tcp"

    security_groups = [
      aws_security_group.node_instance.id,
    ]
  }

  ingress {
    from_port = 1
    to_port   = 2379
    protocol  = "tcp"

    security_groups = [
      aws_security_group.node_instance.id,
    ]
  }

  ingress {
    from_port = 1
    to_port   = 65535
    protocol  = "udp"

    security_groups = [
      aws_security_group.node_instance.id,
    ]
  }

  # For API ELB and my home
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    security_groups = [
      aws_security_group.api_lb.id,
    ]
    cidr_blocks = [var.ssh_from_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.namespace}-master-instance-${var.env}"
    tfstate = var.tfstate
  }
}

resource "aws_security_group" "node_instance" {
  name        = "${var.namespace}-node-instance-${var.env}"
  description = "Kubernetes node instance"

  vpc_id = data.terraform_remote_state.aws_vpc_tokyo.outputs.vpc_id

  tags = {
    Name    = "${var.namespace}-node-instance-${var.env}"
    tfstate = var.tfstate
  }
}

resource "aws_security_group" "api_lb" {
  name        = "${var.namespace}-api-lb-${var.env}"
  description = "Kubernetes API LB"

  vpc_id = data.terraform_remote_state.aws_vpc_tokyo.outputs.vpc_id

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

  tags = {
    Name    = "${var.namespace}-api-lb-${var.env}"
    tfstate = var.tfstate
  }
}

resource "aws_security_group" "service_lb" {
  name        = "${var.namespace}-service-lb-${var.env}"
  description = "Kubernetes internet facing LB"

  vpc_id = data.terraform_remote_state.aws_vpc_tokyo.outputs.vpc_id

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

  tags = {
    Name    = "${var.namespace}-service-lb-${var.env}"
    tfstate = var.tfstate
  }
}

/*
 DB
*/
resource "aws_security_group" "mysql_security_group" {
  name        = "${var.namespace}-db-${var.env}-mysql"
  description = "RDS security group"
  vpc_id      = data.terraform_remote_state.aws_vpc_tokyo.outputs.vpc_id

  ingress {
    from_port = "3306"
    to_port   = "3306"
    protocol  = "tcp"

    security_groups = [
      aws_security_group.node_instance.id,
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${var.namespace}-db-${var.env}-mysql"
    namespace = var.namespace
    role      = "db"
    env       = var.env
    tfstate   = var.tfstate
  }
}

resource "aws_security_group" "postgres_security_group" {
  name        = "${var.namespace}-db-${var.env}-postgres"
  description = "RDS security group"
  vpc_id      = data.terraform_remote_state.aws_vpc_tokyo.outputs.vpc_id

  ingress {
    from_port = "5432"
    to_port   = "5432"
    protocol  = "tcp"

    security_groups = [
      aws_security_group.node_instance.id,
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${var.namespace}-db-${var.env}-postgres"
    namespace = var.namespace
    role      = "db"
    env       = var.env
    tfstate   = var.tfstate
  }
}

