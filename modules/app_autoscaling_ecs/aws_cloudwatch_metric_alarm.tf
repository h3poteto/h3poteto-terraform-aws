resource "aws_cloudwatch_metric_alarm" "ecs_service_metric_high" {
  alarm_name          = "${var.service}-${var.role}-${var.env}-ecs-service-${var.metric}-High"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.high_evaluation_periods}"
  namespace           = "AWS/ECS"
  metric_name         = "${var.metric}"
  period              = "${var.high_alarm_period}"
  statistic           = "${var.high_alarm_statistic}"
  threshold           = "${var.high_threshold}"

  dimensions {
    ClusterName = "${var.ecs_cluster_name}"
    ServiceName = "${var.ecs_service_name}"
  }

  alarm_actions = [
    "${aws_appautoscaling_policy.scale_out.arn}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "ecs_service_metric_low" {
  alarm_name          = "${var.service}-${var.role}-${var.env}-ecs-service-${var.metric}-Low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "${var.low_evaluation_periods}"
  namespace           = "AWS/ECS"
  metric_name         = "${var.metric}"
  period              = "${var.low_alarm_period}"
  statistic           = "${var.low_alarm_statistic}"
  threshold           = "${var.low_threshold}"

  dimensions {
    ClusterName = "${var.ecs_cluster_name}"
    ServiceName = "${var.ecs_service_name}"
  }

  alarm_actions = [
    "${aws_appautoscaling_policy.scale_in.arn}",
  ]
}
