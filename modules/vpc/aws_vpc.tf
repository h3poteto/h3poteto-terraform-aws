resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name    = "${var.service}-${var.env}"
    service = var.service
    env     = var.env
    tfstate = var.tfstate
  }
}
