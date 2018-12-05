resource "aws_eip" "eip" {
  instance = "${aws_instance.instance.id}"
  vpc      = true
}
