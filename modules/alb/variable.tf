variable "service" {}

variable "role" {}

variable "env" {}

variable "region" {}

variable "tfstate" {}

/*
 VPC
*/
variable "vpc_id" {}

variable "subnet_ids" {
  type = "list"
}

/*
 ALB
*/
variable "internal" {
  default = false
}

variable "security_group_ids" {
  default = []
}

variable "alb_access_cidrs" {
  type = "list"
}

variable "ssl_policy" {
  default = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

variable "lb_certificate_arn" {}
