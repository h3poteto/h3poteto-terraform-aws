resource "aws_cloudwatch_event_rule" "refresh_nodes" {
  name                = "${var.namespace}-${var.env}-refresh-nodes"
  description         = "Refresh AutoScalingGroup instances in node role"
  schedule_expression = "cron(0 18-21 ? * FRI *)"
}

resource "aws_cloudwatch_event_rule" "refresh_master_a" {
  name                = "${var.namespace}-${var.env}-refresh-master-a"
  description         = "Refresh AutoScalingGroup instances in master role"
  schedule_expression = "cron(0 18 ? * SAT *)"
}

resource "aws_cloudwatch_event_rule" "refresh_master_c" {
  name                = "${var.namespace}-${var.env}-refresh-master-c"
  description         = "Refresh AutoScalingGroup instances in master role"
  schedule_expression = "cron(0 19 ? * SAT *)"
}

resource "aws_cloudwatch_event_rule" "refresh_master_d" {
  name                = "${var.namespace}-${var.env}-refresh-master-d"
  description         = "Refresh AutoScalingGroup instances in master role"
  schedule_expression = "cron(0 20 ? * SAT *)"
}

