resource "aws_appautoscaling_policy" "scale_out" {
  service_namespace  = "ecs"
  name               = "scale-out"
  resource_id        = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  policy_type        = "StepScaling"
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = "${var.scale_out_cooldown}"
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 1.0
      scaling_adjustment          = "${var.scale_out_adjustment}"
    }
  }

  depends_on = ["aws_appautoscaling_target.target"]
}

resource "aws_appautoscaling_policy" "scale_in" {
  service_namespace  = "ecs"
  name               = "scale-in"
  resource_id        = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  policy_type        = "StepScaling"
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = "${var.scale_in_cooldown}"
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 1.0
      scaling_adjustment          = "${var.scale_in_adjustment}"
    }
  }

  depends_on = ["aws_appautoscaling_target.target"]
}
