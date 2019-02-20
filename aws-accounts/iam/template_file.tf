data "template_file" "eks_pod_assume_role_policy" {
  template = "${file("${path.module}/aws_iam_role_policies/eks_pod_assume_role_policy.json.tpl")}"

  vars {
    eks_node_instance_role_arn = "${aws_iam_role.eks_node_role.arn}"
    k8s_node_instance_role_arn = "${aws_iam_role.k8s_node_role.arn}"
  }
}
