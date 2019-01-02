output "alb_security_group_id" {
  value = "${module.alb.security_group_id}"
}

output "ecs_cluster_id" {
  value = "${module.ecs_cluster.ecs_cluster_id}"
}

output "ecs_cluster_name" {
  value = "${module.ecs_cluster.ecs_cluster_name}"
}

output "ecs_cluster_arn" {
  value = "${module.ecs_cluster.ecs_cluster_arn}"
}

output "ecs_cluster_security_group_id" {
  value = "${module.ecs_cluster.instance_security_group_id}"
}

output "lb_listener_http_arn" {
  value = "${module.alb.lb_listener_http_arn}"
}

output "lb_listener_https_arn" {
  value = "${module.alb.lb_listener_https_arn}"
}

output "lb_dns_name" {
  value = "${module.alb.lb_dns_name}"
}

output "lb_zone_id" {
  value = "${module.alb.lb_zone_id}"
}
