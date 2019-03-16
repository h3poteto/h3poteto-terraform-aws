resource "aws_security_group_rule" "node_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.ssh_from_cidr}"]
  security_group_id = "${aws_security_group.node_instance.id}"
}

resource "aws_security_group_rule" "node_myself" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true
  security_group_id = "${aws_security_group.node_instance.id}"
}

resource "aws_security_group_rule" "node_from_master" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "${aws_security_group.master_instance.id}"
  security_group_id        = "${aws_security_group.node_instance.id}"
}

resource "aws_security_group_rule" "node_from_service" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "${aws_security_group.service_lb.id}"
  security_group_id        = "${aws_security_group.node_instance.id}"
}

resource "aws_security_group_rule" "node_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.node_instance.id}"
}
