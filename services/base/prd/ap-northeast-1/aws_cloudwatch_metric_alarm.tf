resource "aws_cloudwatch_metric_alarm" "ecs_cluster_cpu" {
  alarm_name          = "${var.service}-${var.role}-${var.env}-ecs-cluster-cpu"
  alarm_description   = "ECSClusterのCPU使用率が80%を超えました"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  namespace           = "AWS/ECS"
  metric_name         = "CPUUtilization"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "80"

  dimensions {
    ClusterName = "${module.ecs_cluster.ecs_cluster_name}"
  }

  alarm_actions = [
    "${var.sns_slack_alarm_arn}",
  ]

  ok_actions = [
    "${var.sns_slack_alarm_arn}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "ecs_cluster_memory" {
  alarm_name          = "${var.service}-${var.role}-${var.env}-ecs-cluster-memory"
  alarm_description   = "ECSClusterのメモリ使用率が80%を超えました"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  namespace           = "AWS/ECS"
  metric_name         = "MemoryUtilization"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "80"

  dimensions {
    ClusterName = "${module.ecs_cluster.ecs_cluster_name}"
  }

  alarm_actions = [
    "${var.sns_slack_alarm_arn}",
  ]

  ok_actions = [
    "${var.sns_slack_alarm_arn}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "rds_yuno_cpu" {
  alarm_name          = "${var.service}-${var.role}-${var.env}-rds-yuno-cpu"
  alarm_description   = "yunoのCPU使用率が90%を超えました"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  namespace           = "AWS/RDS"
  metric_name         = "CPUUtilization"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "90"

  dimensions {
    DBInstanceIdentifier = "yuno"
  }

  alarm_actions = [
    "${var.sns_slack_alarm_arn}",
  ]

  ok_actions = [
    "${var.sns_slack_alarm_arn}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "rds_yuno_disk" {
  alarm_name          = "${var.service}-${var.role}-${var.env}-rds-yuno-disk"
  alarm_description   = "yunoのディスク空き領域が1GBを下回りました"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  namespace           = "AWS/RDS"
  metric_name         = "FreeStorageSpace"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "1000000000"

  dimensions {
    DBInstanceIdentifier = "yuno"
  }

  alarm_actions = [
    "${var.sns_slack_alarm_arn}",
  ]

  ok_actions = [
    "${var.sns_slack_alarm_arn}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "rds_nyaruko_cpu" {
  alarm_name          = "${var.service}-${var.role}-${var.env}-rds-nyaruko-cpu"
  alarm_description   = "nyarukoのCPU使用率が90%を超えました"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  namespace           = "AWS/RDS"
  metric_name         = "CPUUtilization"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "90"

  dimensions {
    DBInstanceIdentifier = "nyaruko"
  }

  alarm_actions = [
    "${var.sns_slack_alarm_arn}",
  ]

  ok_actions = [
    "${var.sns_slack_alarm_arn}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "rds_nyaruko_disk" {
  alarm_name          = "${var.service}-${var.role}-${var.env}-rds-nyaruko-disk"
  alarm_description   = "nyarukoのディスク空き領域が1GBを下回りました"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  namespace           = "AWS/RDS"
  metric_name         = "FreeStorageSpace"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "1000000000"

  dimensions {
    DBInstanceIdentifier = "nyaruko"
  }

  alarm_actions = [
    "${var.sns_slack_alarm_arn}",
  ]

  ok_actions = [
    "${var.sns_slack_alarm_arn}",
  ]
}
