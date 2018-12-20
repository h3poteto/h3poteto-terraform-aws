module "pleroma_service" {
  source  = "../../../../modules/ecs_service_with_alb"
  service = "${var.service}"
  role    = "web"
  env     = "${var.env}"
  tfstate = "${var.tfstate}"

  ecs_cluster_id      = "${data.terraform_remote_state.base_prd_tokyo.ecs_cluster_id}"
  vpc_id              = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"
  task_definition_arn = "${aws_ecs_task_definition.web.arn}"
  desired_count       = 0
  iam_role_arn        = "${data.terraform_remote_state.aws_iam.ecs_service_role_arn}"

  container_name = "${var.web_container_name}"
  container_port = "${var.web_container_port}"

  lb_listener_http_arn  = "${data.terraform_remote_state.base_prd_tokyo.lb_listener_http_arn}"
  lb_listener_https_arn = "${data.terraform_remote_state.base_prd_tokyo.lb_listener_https_arn}"
  priority              = 96

  condition_field     = "host-header"
  condition_values    = ["pleroma.io"]
  alb_certificate_arn = "${var.acm_certificate_arn}"
}

module "media_cloudfront" {
  source                        = "../../../../modules/cloudfront_s3"
  s3_bucket_domain_name         = "media.pleroma.io.s3.amazonaws.com"
  s3_bucket_name                = "media.pleroma.io"
  s3_logging_bucket_domain_name = "log.media.pleroma.io.s3.amazonaws.com"
  alternate_domains             = ["media.pleroma.io"]
  acm_certificate_arn           = "${var.cloudfront_certificate_arn}"
}

module "autoscale" {
  source  = "../../../../modules/app_autoscaling_ecs"
  service = "${var.service}"
  role    = "web"
  env     = "${var.env}"

  ecs_cluster_name = "${data.terraform_remote_state.base_prd_tokyo.ecs_cluster_name}"
  ecs_service_name = "${module.pleroma_service.service_name}"
  role_arn         = "arn:aws:iam::${var.account_id}:role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"
}
