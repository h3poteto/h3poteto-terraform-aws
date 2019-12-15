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

