resource "aws_lb" "lb" {
  name               = "${var.service}-${var.role}-${var.env}"
  internal           = "${var.internal}"
  load_balancer_type = "application"

  security_groups = [
    "${var.security_group_ids}",
    "${aws_security_group.alb.id}",
  ]

  subnets = ["${var.subnet_ids}"]

  tags {
    Name    = "${var.service}-${var.role}-${var.env}"
    service = "${var.service}"
    role    = "${var.role}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
