/*
 KMS
*/
resource "aws_iam_policy_attachment" "kms_production" {
  name = "kms-production"

  users = []

  groups = [
    aws_iam_group.h3poteto_developers.name,
  ]

  roles = [
    aws_iam_role.seiyuwatch_prd_pod_role.name,
    aws_iam_role.pleromaio_prd_pod_role.name,
    aws_iam_role.kms_secrets_role.name,
  ]

  policy_arn = module.h3poteto_production_kms.iam_policy_arn
}

resource "aws_iam_policy_attachment" "kms_ci" {
  name = "kms-ci"

  users = [
    aws_iam_user.github_actions.name,
  ]

  groups = [
    aws_iam_group.h3poteto_developers.name,
  ]

  roles = []

  policy_arn = module.ci_kms.iam_policy_arn
}


resource "aws_iam_policy_attachment" "s3_seiyu_watch" {
  name = "s3-seiyu-watch"

  roles = [
    aws_iam_role.seiyuwatch_prd_pod_role.name,
  ]

  policy_arn = aws_iam_policy.s3_seiyu_watch_access.arn
}

resource "aws_iam_policy_attachment" "s3_media_pleroma_io" {
  name = "s3-media-pleroma-io"

  roles = [
    aws_iam_role.pleromaio_prd_pod_role.name,
  ]

  policy_arn = aws_iam_policy.s3_media_pleroma_io_access.arn
}

resource "aws_iam_policy_attachment" "spot_fleet_tagging" {
  name = "spot-fleet-tagging"

  roles = [
    aws_iam_role.spot_fleet_role.name,
  ]

  policy_arn = aws_iam_policy.spot_fleet_tagging_policy.arn
}

resource "aws_iam_policy_attachment" "ecr_h3potet" {
  name = "ecr-h3poteto"

  users = [
    aws_iam_user.circleci.name,
  ]

  policy_arn = aws_iam_policy.ecr_h3poteto_access.arn
}

resource "aws_iam_policy_attachment" "k8s_master" {
  name = "k8s-master"

  roles = [
    aws_iam_role.k8s_master_role.name,
    aws_iam_role.playground_k8s_master_role.name,
  ]

  policy_arn = aws_iam_policy.k8s_master.arn
}

resource "aws_iam_policy_attachment" "k8s_node" {
  name = "k8s-node"

  roles = [
    aws_iam_role.k8s_node_role.name,
    aws_iam_role.playground_k8s_worker_role.name,
  ]

  policy_arn = aws_iam_policy.k8s_node.arn
}

resource "aws_iam_policy_attachment" "sts_assume_for_kiam_role" {
  name = "sts-assume-role-for-kiam-role"

  roles = [
    aws_iam_role.k8s_master_role.name
  ]

  policy_arn = aws_iam_policy.sts_assume_for_kiam_role_policy.arn
}

resource "aws_iam_policy_attachment" "sts_assume_role_for_all" {
  name = "sts-assume-role-for-all"

  roles = [
    aws_iam_role.k8s_node_role.name,
    aws_iam_role.playground_k8s_worker_role.name,
    aws_iam_role.kiam_master_role.name
  ]

  policy_arn = aws_iam_policy.sts_assume_role_for_all_policy.arn
}

resource "aws_iam_policy_attachment" "alb_ingress" {
  name = "alb-ingress"

  roles = [
    aws_iam_role.alb_ingress_controller_role.name,
  ]

  policy_arn = aws_iam_policy.alb_ingress_policy.arn
}

resource "aws_iam_policy_attachment" "node_manager" {
  name = "node-manager"

  roles = [
    aws_iam_role.node_manager_controller_role.name,
  ]

  policy_arn = aws_iam_policy.node_manager_policy.arn
}

resource "aws_iam_policy_attachment" "logs_full" {
  name = "logs-full"

  roles = [
    aws_iam_role.asg_refresher_role.name,
  ]

  policy_arn = aws_iam_policy.logs_full_access_policy.arn
}

resource "aws_iam_policy_attachment" "asg_full" {
  name = "asg-full"

  roles = [
    aws_iam_role.asg_refresher_role.name,
  ]

  policy_arn = aws_iam_policy.asg_full_access_policy.arn
}

resource "aws_iam_policy_attachment" "ec2_full" {
  name = "ec2-full"

  roles = [
    aws_iam_role.asg_refresher_role.name,
  ]

  policy_arn = aws_iam_policy.ec2_full_access_policy.arn
}


resource "aws_iam_policy_attachment" "cloudwatch_read_only" {
  name = "cloudwatch-read-only"

  roles = [
    aws_iam_role.chatbot_slack_notify_role.name
  ]

  policy_arn = aws_iam_policy.cloudwatch_read_only_policy.arn
}
