resource "aws_security_group_rule" "alb" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "${var.alb_security_group_id}"

  security_group_id = "${aws_security_group.instance.id}"
}

resource "aws_security_group_rule" "myself" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "${aws_security_group.instance.id}"

  security_group_id = "${aws_security_group.instance.id}"
}

resource "aws_security_group_rule" "ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "TCP"
  cidr_blocks = ["${var.ssh_from_cidr}"]

  security_group_id = "${aws_security_group.instance.id}"
}

resource "aws_security_group_rule" "egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.instance.id}"
}
