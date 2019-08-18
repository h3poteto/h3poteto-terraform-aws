resource "aws_route53_record" "web" {
  zone_id = var.masuda_stream_host_zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "masuda_stream_net" {
  zone_id = var.masuda_stream_net_host_zone_id
  name    = "masuda-stream.net"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.masuda_stream_net.domain_name
    zone_id                = aws_cloudfront_distribution.masuda_stream_net.hosted_zone_id
    evaluate_target_health = true
  }
}

