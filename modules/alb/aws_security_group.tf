resource "aws_security_group" "alb" {
  name        = "${var.service}-${var.role}-${var.env}-alb"
  description = "http and https"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "TCP"

    cidr_blocks = [
      "${var.alb_access_cidrs}",
    ]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "TCP"

    cidr_blocks = [
      "${var.alb_access_cidrs}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "${var.service}-${var.role}-${var.env}-alb"
    service = "${var.service}"
    role    = "${var.role}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
