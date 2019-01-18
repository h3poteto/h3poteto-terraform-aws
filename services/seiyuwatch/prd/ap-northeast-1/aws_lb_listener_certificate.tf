resource "aws_lb_listener_certificate" "ssl" {
  listener_arn    = "${data.terraform_remote_state.base_prd_tokyo.lb_listener_https_arn}"
  certificate_arn = "${var.acm_certificate_arn}"
}
