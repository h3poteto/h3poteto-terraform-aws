variable "service" {}

variable "role" {}

variable "env" {}

variable "tfstate" {}

variable "ecs_cluster_id" {}

variable "vpc_id" {}

variable "task_definition_arn" {}

variable "desired_count" {
  default = 0
}

variable "iam_role_arn" {}

variable "container_name" {}

variable "container_port" {}

variable "health_check_grace_period_seconds" {
  default = "120"
}

variable "deployment_maximum_percent" {
  default = "200"
}

variable "deployment_minimum_healthy_percent" {
  default = "100"
}

/*
 TargetGroup
*/
variable "health_check_interval" {
  default = "30"
}

variable "health_check_path" {
  default = "/"
}

variable "health_check_port" {
  default = "traffic-port"
}

variable "health_check_protocol" {
  default = "HTTP"
}

variable "health_check_timeout" {
  default = "10"
}

variable "healthy_threshold" {
  default = "3"
}

variable "unhealthy_threshold" {
  default = "3"
}

/*
 ListenerRule
*/
variable "lb_listener_http_arn" {}

variable "lb_listener_https_arn" {}

variable "priority" {
  default = 100
}

variable "condition_field" {}

variable "condition_values" {
  type = "list"
}

variable "alb_certificate_arn" {}
