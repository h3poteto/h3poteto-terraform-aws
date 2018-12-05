resource "aws_lb_listener_rule" "http_to_https" {
  listener_arn = "${var.lb_listener_http_arn}"
  priority     = "${var.priority}"

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    field  = "${var.condition_field}"
    values = ["${var.condition_values}"]
  }
}

resource "aws_lb_listener_rule" "https" {
  listener_arn = "${var.lb_listener_https_arn}"
  priority     = "${var.priority}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.http.arn}"
  }

  condition {
    field  = "${var.condition_field}"
    values = ["${var.condition_values}"]
  }
}
