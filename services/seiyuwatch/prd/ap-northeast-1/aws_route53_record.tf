resource "aws_route53_record" "seiyu_watch" {
  zone_id = "${var.seiyu_watch_host_zone_id}"
  name    = "seiyu.watch"
  type    = "A"

  alias {
    name                   = "${data.terraform_remote_state.base_prd_tokyo.lb_dns_name}"
    zone_id                = "${data.terraform_remote_state.base_prd_tokyo.lb_zone_id}"
    evaluate_target_health = true
  }
}
