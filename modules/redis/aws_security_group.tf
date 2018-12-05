resource "aws_security_group" "security_group" {
  name        = "redis32-${var.service}-${var.env}"
  description = "Security group for ${var.service} on ${var.env}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = ["${var.ingress_security_group_ids}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "redis32-${var.service}-${var.env}"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
