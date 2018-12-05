resource "aws_route53_record" "pleroma_io" {
  zone_id = "${var.pleroma_io_host_zone_id}"
  name    = "pleroma.io"
  type    = "A"

  alias {
    name                   = "${data.terraform_remote_state.base_prd_tokyo.lb_dns_name}"
    zone_id                = "${data.terraform_remote_state.base_prd_tokyo.lb_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "media" {
  zone_id = "${var.pleroma_io_host_zone_id}"
  name    = "media.pleroma.io"
  type    = "A"

  alias {
    name                   = "${module.media_cloudfront.domain_name}"
    zone_id                = "${module.media_cloudfront.hosted_zone_id}"
    evaluate_target_health = true
  }
}
