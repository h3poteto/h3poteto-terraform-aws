resource "aws_security_group" "security_group" {
  name   = "${var.service}-${var.env}"
  vpc_id = "${var.vpc_id}"

  tags {
    Name    = "${var.service}-${var.env}"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
