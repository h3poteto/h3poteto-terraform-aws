resource "aws_eks_cluster" "base" {
  name     = "${var.namespace}-${var.env}"
  role_arn = "${data.terraform_remote_state.aws_iam.eks_master_role_arn}"

  vpc_config {
    security_group_ids = [
      "${aws_security_group.base_master.id}",
    ]

    subnet_ids = [
      "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_1_id}",
      "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_2_id}",
      "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_3_id}",
    ]
  }
}
