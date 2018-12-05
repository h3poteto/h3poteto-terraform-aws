resource "aws_lb_target_group" "blank" {
  name     = "${var.service}-${var.role}-${var.env}-blank"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}
