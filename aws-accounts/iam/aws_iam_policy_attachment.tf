/*
 KMS
*/
resource "aws_iam_policy_attachment" "kms_production" {
  name = "kms-production"

  users = []

  groups = [
    "${aws_iam_group.h3poteto_developers.name}",
  ]

  roles = [
    "${aws_iam_role.asumibot_ec2_role.name}",
    "${aws_iam_role.fascia_prd_ecs_task_role.name}",
    "${aws_iam_role.whalebirdorg_prd_ecs_task_role.name}",
    "${aws_iam_role.seiyuwatch_prd_ecs_task_role.name}",
    "${aws_iam_role.masudastream_prd_ecs_task_role.name}",
    "${aws_iam_role.pleroma_prd_ecs_task_role.name}",
  ]

  policy_arn = "${module.h3poteto_production_kms.iam_policy_arn}"
}

/*
 SSM Parameter Store
*/
resource "aws_iam_policy_attachment" "ssm_get_parameter" {
  name = "ssm"

  roles = [
    "${aws_iam_role.fascia_prd_ecs_task_role.name}",
    "${aws_iam_role.whalebirdorg_prd_ecs_task_role.name}",
    "${aws_iam_role.seiyuwatch_prd_ecs_task_role.name}",
    "${aws_iam_role.masudastream_prd_ecs_task_role.name}",
    "${aws_iam_role.pleroma_prd_ecs_task_role.name}",
  ]

  policy_arn = "${aws_iam_policy.ssm_get_parameter_policy.arn}"
}

resource "aws_iam_policy_attachment" "s3_env_production" {
  name = "s3-env-production"

  # 環境変数等をs3に放り込むのでインスタンスがそこにアクセスできるようにしておく
  roles = [
    "${aws_iam_role.asumibot_ec2_role.name}",
  ]

  policy_arn = "${aws_iam_policy.s3_env_production_access.arn}"
}

resource "aws_iam_policy_attachment" "ses_sending" {
  name = "ses-sending"

  roles = [
    "${aws_iam_role.fascia_prd_ecs_task_role.name}",
  ]

  policy_arn = "${aws_iam_policy.ses_sending_access.arn}"
}

resource "aws_iam_policy_attachment" "s3_seiyu_watch" {
  name = "s3-seiyu-watch"

  roles = [
    "${aws_iam_role.seiyuwatch_prd_ecs_task_role.name}",
  ]

  policy_arn = "${aws_iam_policy.s3_seiyu_watch_access.arn}"
}

resource "aws_iam_policy_attachment" "s3_media_pleroma_io" {
  name = "s3-media-pleroma-io"

  roles = [
    "${aws_iam_role.pleroma_prd_ecs_task_role.name}",
  ]

  policy_arn = "${aws_iam_policy.s3_media_pleroma_io_access.arn}"
}

resource "aws_iam_policy_attachment" "sqs_shoryuken" {
  name = "sqs-shoryuken"

  roles = [
    "${aws_iam_role.asumibot_ec2_role.name}",
  ]

  policy_arn = "${aws_iam_policy.sqs_shoryuken_access.arn}"
}

resource "aws_iam_policy_attachment" "ecs_instance" {
  name = "ecs-instance"

  roles = [
    "${aws_iam_role.ecs_ec2_role.name}",
  ]

  policy_arn = "${aws_iam_policy.ecs_instance_policy.arn}"
}

resource "aws_iam_policy_attachment" "ecs_service" {
  name = "ecs-service"

  roles = [
    "${aws_iam_role.ecs_service_role.name}",
  ]

  policy_arn = "${aws_iam_policy.ecs_service_policy.arn}"
}

resource "aws_iam_policy_attachment" "spot_fleet_tagging" {
  name = "spot-fleet-tagging"

  roles = [
    "${aws_iam_role.spot_fleet_role.name}",
  ]

  policy_arn = "${aws_iam_policy.spot_fleet_tagging_policy.arn}"
}

resource "aws_iam_policy_attachment" "ecs_deploy" {
  name = "ecs-deploy"

  users = [
    "${aws_iam_user.circleci.name}",
  ]

  policy_arn = "${aws_iam_policy.ecs_deploy_policy.arn}"
}

resource "aws_iam_policy_attachment" "ecs_run_task" {
  name = "ecs-run-task"

  roles = [
    "${aws_iam_role.ecs_events_role.name}",
  ]

  policy_arn = "${aws_iam_policy.ecs_run_task_policy.arn}"
}

resource "aws_iam_policy_attachment" "ecr_h3potet" {
  name = "ecr-h3poteto"

  users = [
    "${aws_iam_user.circleci.name}",
  ]

  policy_arn = "${aws_iam_policy.ecr_h3poteto_access.arn}"
}

resource "aws_iam_policy_attachment" "spot_fleet_autoscale" {
  name = "spot-fleet-autoscale"

  roles = [
    "${aws_iam_role.autoscale_ec2_spot_fleet_role.name}",
  ]

  policy_arn = "${aws_iam_policy.spot_fleet_autoscale.arn}"
}
