resource "aws_lb_listener_certificate" "ssl" {
  listener_arn    = "${var.lb_listener_https_arn}"
  certificate_arn = "${var.alb_certificate_arn}"
}
