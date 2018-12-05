resource "aws_cloudwatch_event_target" "rss" {
  target_id = "${var.service}-rss-${var.env}"
  arn       = "${data.terraform_remote_state.base_prd_tokyo.ecs_cluster_arn}"
  rule      = "${aws_cloudwatch_event_rule.rss.name}"
  role_arn  = "${data.terraform_remote_state.aws_iam.ecs_events_role_arn}"

  ecs_target = {
    task_count          = 1
    task_definition_arn = "${aws_ecs_task_definition.task.arn}"
  }

  input = <<DOC
{
  "containerOverrides": [
    {
      "name": "task",
      "command": ["./manage.py", "runscript", "masuda.rss"]
    }
  ]
}
DOC

  lifecycle {
    ignore_changes = ["ecs_target"]
  }
}
