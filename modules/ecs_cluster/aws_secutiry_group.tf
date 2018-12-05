resource "aws_security_group" "instance" {
  name        = "${var.service}-${var.role}-${var.env}-instance"
  description = "instance sg for http and ssh"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    security_groups = [
      "${var.alb_security_group_id}",
    ]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["${var.ssh_from_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "${var.service}-${var.role}-${var.env}-instance"
    service = "${var.service}"
    role    = "${var.role}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
