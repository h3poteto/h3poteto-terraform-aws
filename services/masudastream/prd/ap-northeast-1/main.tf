module "masudastream_service" {
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
  priority              = 97

  condition_field     = "host-header"
  condition_values    = ["masuda-stream.net"]
  alb_certificate_arn = "${var.acm_certificate_arn}"
}
