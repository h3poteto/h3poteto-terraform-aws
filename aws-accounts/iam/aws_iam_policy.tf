resource "aws_iam_policy" "ses_sending_access" {
  name        = "ses-sending-access"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ses_sending_access_policy.json")
}

resource "aws_iam_policy" "s3_seiyu_watch_access" {
  name        = "s3-seiyu-watch-access"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/s3_seiyu_watch_access_policy.json")
}

resource "aws_iam_policy" "s3_media_pleroma_io_access" {
  name        = "s3-media-pleroma-io-access"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/s3_media_pleroma_io_access_policy.json")
}

resource "aws_iam_policy" "spot_fleet_tagging_policy" {
  name        = "spot-fleet-tagging-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/spot_fleet_tagging_policy.json")
}

resource "aws_iam_policy" "ssm_get_parameter_policy" {
  name        = "ssm-get-parameter-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ssm_get_parameter_policy.json")
}

resource "aws_iam_policy" "ecr_h3poteto_access" {
  name        = "ecr-h3poteto-access"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ecr_h3poteto_access_policy.json")
}

resource "aws_iam_policy" "ec2_tag_policy" {
  name        = "ec2-tag-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ec2_tag_policy.json")
}

resource "aws_iam_policy" "sts_assume_role_policy" {
  name        = "sts-assume-role-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/sts_assume_role_policy.json")
}

resource "aws_iam_policy" "alb_ingress_policy" {
  name        = "alb-ingress-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/alb_ingress_policy.json")
}

resource "aws_iam_policy" "route53_change_record_policy" {
  name        = "route53-change-record-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/route53_change_record_policy.json")
}

resource "aws_iam_policy" "k8s_cluster" {
  name        = "k8s-cluster-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/k8s_cluster_policy.json")
}

resource "aws_iam_policy" "ec2_network_access" {
  name        = "ec2-network-access-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ec2_network_access_policy.json")
}

resource "aws_iam_policy" "ecr_get" {
  name        = "ecr-get-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ecr_get_policy.json")
}

resource "aws_iam_policy" "s3_get" {
  name        = "s3-get-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/s3_get_policy.json")
}

resource "aws_iam_policy" "logs_full_access_policy" {
  name        = "logs-full-access-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/logs_full_access_policy.json")
}

resource "aws_iam_policy" "asg_full_access_policy" {
  name        = "asg-full-access-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/asg_full_access_policy.json")
}

resource "aws_iam_policy" "ec2_full_access_policy" {
  name        = "ec2-full-access-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ec2_full_access_policy.json")
}


resource "aws_iam_policy" "sts_assume_for_kiam_role_policy" {
  name        = "sts-assume-for-kiam-role-policy"
  path        = "/"
  description = ""
  policy      = data.template_file.kiam_role_assume_role_policy.rendered
}
