resource "aws_lambda_permission" "nodes" {
  statement_id  = "AllowExecutionFromNodeCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "asg-refresher_terminate"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.refresh_nodes.arn
}

resource "aws_lambda_permission" "master_a" {
  statement_id  = "AllowExecutionFromMasterACloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "asg-refresher_terminate"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.refresh_master_a.arn
}

resource "aws_lambda_permission" "master_c" {
  statement_id  = "AllowExecutionFromMasterCCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "asg-refresher_terminate"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.refresh_master_c.arn
}

resource "aws_lambda_permission" "master_d" {
  statement_id  = "AllowExecutionFromMasterDCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "asg-refresher_terminate"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.refresh_master_d.arn
}

