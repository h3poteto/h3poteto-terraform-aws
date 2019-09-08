data "template_file" "k8s_pod_assume_role_policy" {
  template = file(
    "${path.module}/aws_iam_role_policies/k8s_pod_assume_role_policy.json.tpl",
  )

  vars = {
    kiam_master_role_arn = aws_iam_role.kiam_master_role.arn
  }
}

data "template_file" "account_assume_role_policy" {
  template = file(
    "${path.module}/aws_iam_role_policies/arn_assume_role_policy.json.tpl",
  )

  vars = {
    arn = var.account_id
  }
}

data "template_file" "k8s_master_assume_role_policy" {
  template = file(
    "${path.module}/aws_iam_role_policies/arn_assume_role_policy.json.tpl"
  )

  vars = {
    arn = aws_iam_role.k8s_master_role.arn
  }
}

data "template_file" "sts_assume_for_kiam_role_policy" {
  template = file(
    "${path.module}/aws_iam_policies/sts_assume_role_for_role_policy.json.tpl"
  )

  vars = {
    role = aws_iam_role.kiam_master_role.arn
  }
}
