resource "aws_appautoscaling_policy" "scale_out" {
  service_namespace  = "ec2"
  name               = "scale-out"
  resource_id        = "spot-fleet-request/${var.spot_fleet_request_id}"
  policy_type        = "StepScaling"
  scalable_dimension = "ec2:spot-fleet-request:TargetCapacity"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = "${var.scale_out_cooldown}"
    metric_aggregation_type = "Maximum"

    step_adjustment {
      scaling_adjustment          = "${var.scale_out_adjustment}"
      metric_interval_lower_bound = 1.0
    }
  }

  depends_on = ["aws_appautoscaling_target.target"]
}

resource "aws_appautoscaling_policy" "scale_in" {
  service_namespace  = "ec2"
  name               = "scale-in"
  resource_id        = "spot-fleet-request/${var.spot_fleet_request_id}"
  policy_type        = "StepScaling"
  scalable_dimension = "ec2:spot-fleet-request:TargetCapacity"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = "${var.scale_in_cooldown}"
    metric_aggregation_type = "Maximum"

    step_adjustment {
      scaling_adjustment          = "${var.scale_in_adjustment}"
      metric_interval_lower_bound = 1.0
    }
  }

  depends_on = ["aws_appautoscaling_target.target"]
}
