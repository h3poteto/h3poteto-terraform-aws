resource "aws_cloudwatch_event_rule" "rss" {
  name        = "${var.service}-rss-${var.env}"
  description = ""

  schedule_expression = "cron(*/15 * * * ? *)"
}
