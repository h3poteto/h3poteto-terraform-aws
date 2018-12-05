resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name    = "${var.service}-${var.env}"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
