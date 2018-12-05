resource "aws_route53_record" "masuda_stream_net" {
  zone_id = "${var.masuda_stream_net_host_zone_id}"
  name    = "masuda-stream.net"
  type    = "A"

  alias {
    name                   = "${data.terraform_remote_state.base_prd_tokyo.lb_dns_name}"
    zone_id                = "${data.terraform_remote_state.base_prd_tokyo.lb_zone_id}"
    evaluate_target_health = true
  }
}
