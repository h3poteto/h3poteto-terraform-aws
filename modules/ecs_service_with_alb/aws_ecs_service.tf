resource "aws_ecs_service" "service" {
  name                               = "${var.service}-${var.role}-${var.env}"
  cluster                            = "${var.ecs_cluster_id}"
  task_definition                    = "${var.task_definition_arn}"
  desired_count                      = "${var.desired_count}"
  iam_role                           = "${var.iam_role_arn}"
  launch_type                        = "EC2"
  health_check_grace_period_seconds  = "${var.health_check_grace_period_seconds}"
  deployment_maximum_percent         = "${var.deployment_maximum_percent}"
  deployment_minimum_healthy_percent = "${var.deployment_minimum_healthy_percent}"

  load_balancer {
    target_group_arn = "${aws_lb_target_group.http.arn}"
    container_name   = "${var.container_name}"
    container_port   = "${var.container_port}"
  }

  ordered_placement_strategy {
    type  = "binpack"
    field = "memory"
  }

  lifecycle {
    ignore_changes = ["desired_count", "task_definition"]
  }
}
