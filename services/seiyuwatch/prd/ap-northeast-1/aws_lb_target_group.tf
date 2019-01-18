resource "aws_lb_target_group" "http" {
  name     = "${var.service}-web-${var.env}-http"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  health_check {
    interval            = "30"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "10"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
  }
}
