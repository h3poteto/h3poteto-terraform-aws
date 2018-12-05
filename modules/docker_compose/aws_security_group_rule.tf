resource "aws_security_group_rule" "ingress" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["${var.operation_ip_addresses}"]

  security_group_id = "${aws_security_group.security_group.id}"

  # 自宅IPが頻繁に変わるようであるならignoreするのも手ではある
  # lifecycle {
  #   ignore_changes = ["cidr_blocks"]
  # }
}

resource "aws_security_group_rule" "egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.security_group.id}"
}
