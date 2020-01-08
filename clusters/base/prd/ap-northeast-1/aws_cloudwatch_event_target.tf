resource "aws_cloudwatch_event_target" "refresh_nodes" {
  rule      = aws_cloudwatch_event_rule.refresh_nodes.name
  target_id = "TerminateOldestInstance"
  arn       = "arn:aws:lambda:ap-northeast-1:564677439943:function:asg-refresher_terminate"
  input     = "{\"target_asgs\":[\"nodes.external-prd.k8s.h3poteto.dev\"]}"
}

resource "aws_cloudwatch_event_target" "refresh_master_a" {
  rule      = aws_cloudwatch_event_rule.refresh_master_a.name
  target_id = "TerminateOldestInstance"
  arn       = "arn:aws:lambda:ap-northeast-1:564677439943:function:asg-refresher_terminate"
  input     = "{\"target_asgs\":[\"master-ap-northeast-1a.masters.external-prd.k8s.h3poteto.dev\",\"master-ap-northeast-1c.masters.external-prd.k8s.h3poteto.dev\",\"master-ap-northeast-1d.masters.external-prd.k8s.h3poteto.dev\"]}"
}

resource "aws_cloudwatch_event_target" "refresh_master_c" {
  rule      = aws_cloudwatch_event_rule.refresh_master_c.name
  target_id = "TerminateOldestInstance"
  arn       = "arn:aws:lambda:ap-northeast-1:564677439943:function:asg-refresher_terminate"
  input     = "{\"target_asgs\":[\"master-ap-northeast-1c.masters.external-prd.k8s.h3poteto.dev\",\"master-ap-northeast-1d.masters.external-prd.k8s.h3poteto.dev\",\"master-ap-northeast-1a.masters.external-prd.k8s.h3poteto.dev\"]}"
}

resource "aws_cloudwatch_event_target" "refresh_master_d" {
  rule      = aws_cloudwatch_event_rule.refresh_master_d.name
  target_id = "TerminateOldestInstance"
  arn       = "arn:aws:lambda:ap-northeast-1:564677439943:function:asg-refresher_terminate"
  input     = "{\"target_asgs\":[\"master-ap-northeast-1d.masters.external-prd.k8s.h3poteto.dev\",\"master-ap-northeast-1a.masters.external-prd.k8s.h3poteto.dev\",\"master-ap-northeast-1c.masters.external-prd.k8s.h3poteto.dev\"]}"
}

