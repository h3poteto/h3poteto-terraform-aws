resource "aws_route53_health_check" "web" {
  fqdn              = var.alb_dns_name
  port              = 80
  type              = "HTTP"
  resource_path     = "/pleroma/api/v1/instance"
  failure_threshold = 2
  request_interval  = 30

  tags = {
    Name    = "${var.service}-web-${var.env}"
    role    = "web"
    service = var.service
    env     = var.env
    tfstate = var.tfstate
  }
}
