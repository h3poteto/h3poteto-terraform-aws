resource "aws_route53_record" "fascia_io" {
  zone_id = "${var.fascia_io_host_zone_id}"
  name    = "fascia.io"
  type    = "A"

  alias {
    name                   = "${data.terraform_remote_state.base_prd_tokyo.lb_dns_name}"
    zone_id                = "${data.terraform_remote_state.base_prd_tokyo.lb_zone_id}"
    evaluate_target_health = true
  }
}
