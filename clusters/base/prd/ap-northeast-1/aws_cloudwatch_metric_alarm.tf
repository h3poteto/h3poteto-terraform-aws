resource "aws_cloudwatch_metric_alarm" "asg_nodes" {
  alarm_name          = "Node instances are terminated"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/AutoScaling"
  period              = 300
  statistic           = "Minimum"
  threshold           = 3
  alarm_description   = "Nodeのインスタンスが不足しています"

  dimensions = {
    AutoScalingGroupName = "nodes.external-prd-20200329.k8s.h3poteto.dev"
  }
  alarm_actions = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
  ok_actions    = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
}

resource "aws_cloudwatch_metric_alarm" "asg_master_a" {
  alarm_name          = "Master A instances are terminated"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/AutoScaling"
  period              = 300
  statistic           = "Minimum"
  threshold           = 1
  alarm_description   = "master-1aのインスタンスが不足しています"
  dimensions = {
    AutoScalingGroupName = "master-ap-northeast-1a.masters.external-prd-20200329.k8s.h3poteto.dev"
  }

  alarm_actions = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
  ok_actions    = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
}


resource "aws_cloudwatch_metric_alarm" "asg_master_c" {
  alarm_name          = "Master C instances are terminated"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/AutoScaling"
  period              = 300
  statistic           = "Minimum"
  threshold           = 1
  alarm_description   = "master-1cのインスタンスが不足しています"
  dimensions = {
    AutoScalingGroupName = "master-ap-northeast-1c.masters.external-prd-20200329.k8s.h3poteto.dev"
  }

  alarm_actions = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
  ok_actions    = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
}

resource "aws_cloudwatch_metric_alarm" "asg_master_d" {
  alarm_name          = "Master D instances are terminated"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/AutoScaling"
  period              = 300
  statistic           = "Minimum"
  threshold           = 1
  alarm_description   = "master-1dのインスタンスが不足しています"
  dimensions = {
    AutoScalingGroupName = "master-ap-northeast-1d.masters.external-prd-20200329.k8s.h3poteto.dev"
  }

  alarm_actions = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
  ok_actions    = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
}

resource "aws_cloudwatch_metric_alarm" "rds_storage" {
  alarm_name          = "RDS storage space alert"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 3
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Minimum"
  threshold           = 20000000000
  alarm_description   = "RDSの空き容量が不足しています"

  alarm_actions = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
  ok_actions    = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu" {
  alarm_name          = "RDS CPU utilization alert"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Maximum"
  threshold           = 80
  alarm_description   = "RDSのCPU使用率が80%を超えています"

  alarm_actions = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
  ok_actions    = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
}

resource "aws_cloudwatch_metric_alarm" "rds_memory" {
  alarm_name          = "RDS freeable memory alert"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 3
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Maximum"
  threshold           = 200000000
  alarm_description   = "RDSの空きメモリが200MBを下回っています"

  alarm_actions = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
  ok_actions    = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
}

resource "aws_cloudwatch_metric_alarm" "elb_response_time" {
  alarm_name          = "ALB Target response time"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = 300
  statistic           = "Average"
  threshold           = 20
  dimensions = {
    LoadBalancer = "app/a5a91729-webpublic-albingr-4676/31765f5ebf155f54"
  }
  alarm_description = "ALBのレスポンスタイムが20秒を超えています"

  alarm_actions = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
  ok_actions    = ["arn:aws:sns:ap-northeast-1:564677439943:slack-alarm"]
}