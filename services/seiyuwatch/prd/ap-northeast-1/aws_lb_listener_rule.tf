resource "aws_lb_listener_rule" "http_to_https" {
  listener_arn = "${data.terraform_remote_state.base_prd_tokyo.lb_listener_http_arn}"
  priority     = "98"

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    field  = "host-header"
    values = ["seiyu.watch"]
  }
}

resource "aws_lb_listener_rule" "https" {
  listener_arn = "${data.terraform_remote_state.base_prd_tokyo.lb_listener_https_arn}"
  priority     = "98"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.http.arn}"
  }

  condition {
    field  = "host-header"
    values = ["seiyu.watch"]
  }
}
