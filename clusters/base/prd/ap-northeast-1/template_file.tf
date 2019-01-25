data "template_file" "kubeconfig" {
  template = "${file("${path.module}/kubeconfig.yml.tpl")}"

  vars {
    master_endpoint       = "${aws_eks_cluster.base.endpoint}"
    certificate_authority = "${aws_eks_cluster.base.certificate_authority.0.data}"
    name                  = "${aws_eks_cluster.base.id}"
  }
}

data "template_file" "eksconfig" {
  template = "${file("${path.module}/eksconfig.yml.tpl")}"

  vars {
    node_role_arn = "${data.terraform_remote_state.aws_iam.eks_node_role_arn}"
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"

  vars {
    master_endpoint       = "${aws_eks_cluster.base.endpoint}"
    certificate_authority = "${aws_eks_cluster.base.certificate_authority.0.data}"
    name                  = "${aws_eks_cluster.base.id}"
    custom_tag_key        = "kubernetes.io/cluster/${aws_eks_cluster.base.id}"
    custom_tag_value      = "owned"
  }
}
