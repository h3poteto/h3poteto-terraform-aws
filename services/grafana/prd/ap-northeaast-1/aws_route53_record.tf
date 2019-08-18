resource "aws_route53_record" "grafana" {
  zone_id = var.h3poteto_dev_host_zone_id
  name    = "k8s-monitor"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_hosted_zone_id
    evaluate_target_health = true
  }
}

