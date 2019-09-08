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
    aws_iam_role.fascia_prd_pod_role.name,
    aws_iam_role.whalebirdorg_prd_pod_role.name,
    aws_iam_role.seiyuwatch_prd_pod_role.name,
    aws_iam_role.masudastream_prd_pod_role.name,
    aws_iam_role.pleromaio_prd_pod_role.name,
  ]

  policy_arn = module.h3poteto_production_kms.iam_policy_arn
}

/*
 SSM Parameter Store
*/
resource "aws_iam_policy_attachment" "ssm_get_parameter" {
  name = "ssm"

  roles = [
    aws_iam_role.fascia_prd_pod_role.name,
    aws_iam_role.whalebirdorg_prd_pod_role.name,
    aws_iam_role.seiyuwatch_prd_pod_role.name,
    aws_iam_role.masudastream_prd_pod_role.name,
    aws_iam_role.pleromaio_prd_pod_role.name,
  ]

  policy_arn = aws_iam_policy.ssm_get_parameter_policy.arn
}

resource "aws_iam_policy_attachment" "ses_sending" {
  name = "ses-sending"

  roles = [
    aws_iam_role.fascia_prd_pod_role.name,
  ]

  policy_arn = aws_iam_policy.ses_sending_access.arn
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

resource "aws_iam_policy_attachment" "k8s_cluster" {
  name = "k8s-cluster"

  roles = [
    aws_iam_role.k8s_master_role.name,
  ]

  policy_arn = aws_iam_policy.k8s_cluster.arn
}

resource "aws_iam_policy_attachment" "ec2_network_access" {
  name = "ec2-network-access"

  roles = [
    aws_iam_role.k8s_node_role.name,
  ]

  policy_arn = aws_iam_policy.ec2_network_access.arn
}

resource "aws_iam_policy_attachment" "ecr_get" {
  name = "ecr-get"

  roles = [
    aws_iam_role.k8s_node_role.name,
  ]

  policy_arn = aws_iam_policy.ecr_get.arn
}

resource "aws_iam_policy_attachment" "s3_get" {
  name = "s3-get"

  roles = [
    aws_iam_role.k8s_node_role.name,
  ]

  policy_arn = aws_iam_policy.s3_get.arn
}


resource "aws_iam_policy_attachment" "sts_assume_for_kiam_role" {
  name = "sts-assume-role-for-kiam-role"

  roles = [
    aws_iam_role.k8s_master_role.name
  ]

  policy_arn = aws_iam_policy.sts_assume_for_kiam_role_policy.arn
}

resource "aws_iam_policy_attachment" "sts_assume_role" {
  name = "sts-assume-role"

  roles = [
    aws_iam_role.kiam_master_role.name
  ]

  policy_arn = aws_iam_policy.sts_assume_role_policy.arn
}

resource "aws_iam_policy_attachment" "alb_ingress" {
  name = "alb-ingress"

  roles = [
    aws_iam_role.alb_ingress_controller_role.name,
  ]

  policy_arn = aws_iam_policy.alb_ingress_policy.arn
}

resource "aws_iam_policy_attachment" "route53_change_record" {
  name = "route53-change-record"

  roles = [
    aws_iam_role.external_dns_role.name,
  ]

  policy_arn = aws_iam_policy.route53_change_record_policy.arn
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

