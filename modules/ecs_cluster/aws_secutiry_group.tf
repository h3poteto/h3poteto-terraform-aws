resource "aws_security_group" "instance" {
  name        = "${var.service}-${var.role}-${var.env}-instance"
  description = "instance sg for http and ssh"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name    = "${var.service}-${var.role}-${var.env}-instance"
    service = "${var.service}"
    role    = "${var.role}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
