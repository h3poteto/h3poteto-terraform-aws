resource "aws_db_subnet_group" "db" {
  name = "${var.service}-${var.env}"

  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id,
    aws_subnet.private_subnet_3.id,
  ]

  tags = {
    Name    = "${var.service}-${var.env}"
    service = var.service
    env     = var.env
    tfstate = var.tfstate
  }
}
