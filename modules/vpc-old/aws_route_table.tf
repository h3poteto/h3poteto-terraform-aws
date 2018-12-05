resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name    = "${var.service}-${var.env}-route-table"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
