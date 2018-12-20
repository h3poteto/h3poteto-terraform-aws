module "alb" {
  source  = "../../../../modules/alb"
  service = "${var.service}"
  role    = "${var.role}"
  env     = "${var.env}"
  region  = "${var.region}"
  tfstate = "${var.tfstate}"

  vpc_id = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  subnet_ids = [
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_1_id}",
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_2_id}",
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_3_id}",
  ]

  alb_access_cidrs = [
    "0.0.0.0/0",
  ]

  lb_certificate_arn = "${var.default_acm_arn}"
}

module "ecs_cluster" {
  source  = "../../../../modules/ecs_cluster"
  service = "${var.service}"
  role    = "${var.role}"
  env     = "${var.env}"
  region  = "${var.region}"
  tfstate = "${var.tfstate}"

  vpc_id = "${data.terraform_remote_state.aws_vpc_tokyo.vpc_id}"

  subnet_ids = [
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_1_id}",
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_2_id}",
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_3_id}",
  ]

  alb_security_group_id = "${module.alb.security_group_id}"

  iam_fleet_role_arn        = "${data.terraform_remote_state.aws_iam.spot_fleet_role_arn}"
  ec2_instance_profile_name = "${data.terraform_remote_state.aws_iam.ecs_instance_profile_name}"

  key_name                 = "${var.key_name}"
  ami                      = "${var.ami}"
  ssh_from_cidr            = "${var.operation_cidr}"
  ec2_instance_profile_arn = "${data.terraform_remote_state.aws_iam.ecs_instance_profile_arn}"
  spot_target_capacity     = "3"
}

module "autoscale_spot_fleet" {
  source  = "../../../../modules/app_autoscaling_spot_fleet"
  service = "${var.service}"
  role    = "${var.role}"
  env     = "${var.env}"

  ecs_cluster_name      = "${module.ecs_cluster.ecs_cluster_name}"
  spot_fleet_request_id = "${module.ecs_cluster.spot_fleet_request_id}"
  role_arn              = "arn:aws:iam::${var.account_id}:role/aws-service-role/ec2.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_EC2SpotFleetRequest"
}
