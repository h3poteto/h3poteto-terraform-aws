resource "aws_iam_policy" "s3_env_production_access" {
  name        = "s3-env-production-access"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/s3_env_production_access_policy.json")}"
}

resource "aws_iam_policy" "ses_sending_access" {
  name        = "ses-sending-access"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ses_sending_access_policy.json")}"
}

resource "aws_iam_policy" "s3_seiyu_watch_access" {
  name        = "s3-seiyu-watch-access"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/s3_seiyu_watch_access_policy.json")}"
}

resource "aws_iam_policy" "s3_media_pleroma_io_access" {
  name        = "s3-media-pleroma-io-access"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/s3_media_pleroma_io_access_policy.json")}"
}

resource "aws_iam_policy" "sqs_shoryuken_access" {
  name        = "sqs-shoryuken-access"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/sqs_shoryuken_access_policy.json")}"
}

resource "aws_iam_policy" "ecs_instance_policy" {
  name        = "ecs-instance-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ecs_instance_policy.json")}"
}

resource "aws_iam_policy" "ecs_service_policy" {
  name        = "ecs-service-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ecs_service_policy.json")}"
}

resource "aws_iam_policy" "spot_fleet_tagging_policy" {
  name        = "spot-fleet-tagging-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/spot_fleet_tagging_policy.json")}"
}

resource "aws_iam_policy" "ssm_get_parameter_policy" {
  name        = "ssm-get-parameter-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ssm_get_parameter_policy.json")}"
}

resource "aws_iam_policy" "ecs_deploy_policy" {
  name        = "ecs-deploy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ecs_deploy_policy.json")}"
}

resource "aws_iam_policy" "ecs_run_task_policy" {
  name        = "ecs-run-task"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ecs_run_task_policy.json")}"
}

resource "aws_iam_policy" "ecr_h3poteto_access" {
  name        = "ecr-h3poteto-access"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ecr_h3poteto_access_policy.json")}"
}

resource "aws_iam_policy" "ecs_erlang_cluster_policy" {
  name        = "ecs-erlang-cluster-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ecs_erlang_cluster_policy.json")}"
}

resource "aws_iam_policy" "ec2_tag_policy" {
  name        = "ec2-tag-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ec2_tag_policy.json")}"
}

resource "aws_iam_policy" "sts_assume_role_policy" {
  name        = "sts-assume-role-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/sts_assume_role_policy.json")}"
}

resource "aws_iam_policy" "alb_ingress_policy" {
  name        = "alb-ingress-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/alb_ingress_policy.json")}"
}

resource "aws_iam_policy" "route53_change_record_policy" {
  name        = "route53-change-record-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/route53_change_record_policy.json")}"
}

resource "aws_iam_policy" "k8s_cluster" {
  name        = "k8s-cluster-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/k8s_cluster_policy.json")}"
}

resource "aws_iam_policy" "ec2_network_access" {
  name        = "ec2-network-access-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ec2_network_access_policy.json")}"
}

resource "aws_iam_policy" "ecr_get" {
  name        = "ecr-get-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/ecr_get_policy.json")}"
}

resource "aws_iam_policy" "s3_get" {
  name        = "s3-get-policy"
  path        = "/"
  description = ""
  policy      = "${file("aws_iam_policies/s3_get_policy.json")}"
}
