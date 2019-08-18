resource "aws_route53_record" "media" {
  zone_id = var.pleroma_io_host_zone_id
  name    = "media.pleroma.io"
  type    = "A"

  alias {
    name                   = module.media_cloudfront.domain_name
    zone_id                = module.media_cloudfront.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "web" {
  zone_id = var.pleroma_io_host_zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_hosted_zone_id
    evaluate_target_health = true
  }
}

