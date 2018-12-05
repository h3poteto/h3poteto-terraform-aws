resource "aws_route53_record" "whalebird_org" {
  zone_id = "${var.whalebird_org_host_zone_id}"
  name    = "whalebird.org"
  type    = "A"

  alias {
    name                   = "${data.terraform_remote_state.base_prd_tokyo.lb_dns_name}"
    zone_id                = "${data.terraform_remote_state.base_prd_tokyo.lb_zone_id}"
    evaluate_target_health = true
  }
}
