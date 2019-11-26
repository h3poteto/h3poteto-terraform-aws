resource "aws_route53_record" "web" {
  zone_id = var.whalebird_social_host_zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "whalebird_org" {
  zone_id = var.whalebird_org_host_zone_id
  name    = "whalebird.org"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.whalebird_org.domain_name
    zone_id                = aws_cloudfront_distribution.whalebird_org.hosted_zone_id
    evaluate_target_health = true
  }
}
