resource "aws_route53_record" "web" {
  zone_id = var.fascia_io_zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_hosted_zone_id
    evaluate_target_health = true
  }
}

