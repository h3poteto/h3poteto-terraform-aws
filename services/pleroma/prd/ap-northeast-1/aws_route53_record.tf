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

  health_check_id = aws_route53_health_check.web.id
  set_identifier  = "web-primary"

  failover_routing_policy {
    type = "PRIMARY"
  }
}

resource "aws_route53_record" "maintenance" {
  zone_id = var.pleroma_io_host_zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.maintenance.domain_name
    zone_id                = aws_cloudfront_distribution.maintenance.hosted_zone_id
    evaluate_target_health = false
  }

  set_identifier = "web-secondary"

  failover_routing_policy {
    type = "SECONDARY"
  }
}

