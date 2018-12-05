resource "aws_route_table_association" "route_table_association_1" {
  subnet_id      = "${aws_subnet.subnet_1.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}

resource "aws_route_table_association" "route_table_association_2" {
  subnet_id      = "${aws_subnet.subnet_2.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}

resource "aws_route_table_association" "route_table_association_3" {
  subnet_id      = "${aws_subnet.subnet_3.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}
