resource "aws_ecs_cluster" "cluster" {
  name = "${var.service}-${var.role}-${var.env}"
}
