output "security_group_id" {
  value = "${aws_security_group.alb.id}"
}

output "lb_listener_http_arn" {
  value = "${aws_lb_listener.http.arn}"
}

output "lb_listener_https_arn" {
  value = "${aws_lb_listener.https.arn}"
}

output "lb_dns_name" {
  value = "${aws_lb.lb.dns_name}"
}

output "lb_zone_id" {
  value = "${aws_lb.lb.zone_id}"
}
