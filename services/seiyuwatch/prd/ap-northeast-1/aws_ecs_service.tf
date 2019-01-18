resource "aws_ecs_service" "service" {
  name                               = "${var.service}-web-${var.env}"
  cluster                            = "${data.terraform_remote_state.base_prd_tokyo.ecs_cluster_id}"
  task_definition                    = "${aws_ecs_task_definition.web.arn}"
  desired_count                      = "0"
  iam_role                           = "${data.terraform_remote_state.aws_iam.ecs_service_role_arn}"
  launch_type                        = "EC2"
  health_check_grace_period_seconds  = "120"
  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "50"

  load_balancer {
    target_group_arn = "${aws_lb_target_group.http.arn}"
    container_name   = "${var.web_container_name}"
    container_port   = "${var.web_container_port}"
  }

  placement_constraints {
    type = "distinctInstance"
  }

  lifecycle {
    ignore_changes = ["desired_count", "task_definition"]
  }
}
