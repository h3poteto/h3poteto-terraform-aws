module "base_asg" {
  source  = "../../../../modules/autoscaling_group"
  service = "${var.namespace}"
  role    = "node"
  env     = "${var.env}"
  tfstate = "${var.tfstate}"

  subnet_ids = [
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_1_id}",
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_2_id}",
    "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_3_id}",
  ]

  ami                  = "${var.ami}"
  instance_type        = "t3.medium"
  volume_size          = "${var.volume_size}"
  iam_instance_profile = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_arn}"
  key_name             = "${var.key_name}"
  user_data            = "${data.template_file.user_data.rendered}"
  security_group_ids   = ["${aws_security_group.base_node.id}"]
  max_size             = "5"
  min_size             = "0"
  spot_price           = "0.05"
  custom_tag_key       = "kubernetes.io/cluster/${aws_eks_cluster.base.id}"
  custom_tag_value     = "owned"
}
