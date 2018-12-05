resource "aws_default_network_acl" "default_network_acl" {
  default_network_acl_id = "${aws_vpc.vpc.default_network_acl_id}"

  subnet_ids = [
    "${aws_subnet.public_subnet_1.id}",
    "${aws_subnet.public_subnet_2.id}",
    "${aws_subnet.public_subnet_3.id}",
    "${aws_subnet.private_subnet_1.id}",
    "${aws_subnet.private_subnet_2.id}",
    "${aws_subnet.private_subnet_3.id}",
  ]

  ingress {
    from_port  = 0
    to_port    = 0
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port  = 0
    to_port    = 0
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }

  tags {
    Name    = "${var.service}-${var.env}"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
