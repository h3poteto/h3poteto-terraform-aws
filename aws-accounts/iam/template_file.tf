data "template_file" "k8s_pod_assume_role_policy" {
  template = file(
    "${path.module}/aws_iam_role_policies/k8s_pod_assume_role_policy.json.tpl",
  )

  vars = {
    k8s_node_instance_role_arn = aws_iam_role.k8s_node_role.arn
    kiam_master_role_arn       = aws_iam_role.kiam_master_role.arn
  }
}

data "template_file" "account_assume_role_policy" {
  template = file(
    "${path.module}/aws_iam_role_policies/sts_assume_role_policy.json.tpl",
  )

  vars = {
    arn = var.account_id
  }
}

data "template_file" "k8s_master_assume_role_policy" {
  template = file(
    "${path.module}/aws_iam_role_policies/sts_assume_role_policy.json.tpl"
  )

  vars = {
    arn = aws_iam_role.k8s_master_role.arn
  }
}

data "template_file" "kiam_role_assume_role_policy" {
  template = file(
    "${path.module}/aws_iam_policies/sts_assume_role_policy.json.tpl"
  )

  vars = {
    role = aws_iam_role.kiam_master_role.arn
  }
}
