resource "aws_appautoscaling_target" "target" {
  service_namespace  = "ecs"
  resource_id        = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  role_arn           = "${var.role_arn}"
  min_capacity       = "${var.min_capacity}"
  max_capacity       = "${var.max_capacity}"
}
