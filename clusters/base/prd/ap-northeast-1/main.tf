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

  ami                  = "ami-0f0e8066383e7a2cb"                                                # amazon-eks-node-1.11-v20190109
  instance_type        = "t3.medium"
  volume_size          = "50"
  iam_instance_profile = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_arn}"
  key_name             = "h3poteto-aws-key"
  user_data            = "${data.template_file.user_data.rendered}"
  security_group_ids   = ["${aws_security_group.base_node.id}"]
  max_size             = "5"
  min_size             = "0"
}
