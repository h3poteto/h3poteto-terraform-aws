resource "aws_iam_role" "spot_fleet_role" {
  name               = "spot-fleet-role"
  path               = "/"
  assume_role_policy = file("aws_iam_role_policies/spot_fleet_assume_role_policy.json")
}

/*
 lambda
*/
resource "aws_iam_role" "asg_refresher_role" {
  name               = "asg-refresher-role"
  path               = "/"
  assume_role_policy = file("aws_iam_role_policies/lambda_assume_role_policy.json")
}

/*
 kops
*/
resource "aws_iam_role" "k8s_master_role" {
  name               = "k8s-master-role"
  path               = "/"
  assume_role_policy = file("aws_iam_role_policies/ec2_assume_role_policy.json")
}

resource "aws_iam_role" "k8s_node_role" {
  name               = "k8s-node-role"
  path               = "/"
  assume_role_policy = file("aws_iam_role_policies/ec2_assume_role_policy.json")
}

/*
 kiam
*/
resource "aws_iam_role" "kiam_master_role" {
  name               = "kiam-master-role"
  path               = "/"
  assume_role_policy = data.template_file.k8s_master_assume_role_policy.rendered
}


/*
 System pods
*/
resource "aws_iam_role" "alb_ingress_controller_role" {
  name = "alb-ingress-controller-role"
  path = "/"

  assume_role_policy = data.template_file.irsa_assume_role_policy.rendered
}

resource "aws_iam_role" "kms_secrets_role" {
  name               = "kms-secrets-role"
  path               = "/"
  assume_role_policy = data.template_file.irsa_assume_role_policy.rendered
}

resource "aws_iam_role" "kubernetes_admin_role" {
  name               = "kubernetes-admin-role"
  path               = "/"
  assume_role_policy = data.template_file.account_assume_role_policy.rendered
}

/*
 Kubernetes Pods
*/
resource "aws_iam_role" "whalebirdorg_prd_pod_role" {
  name               = "whalebirdorg-prd-pod-role"
  path               = "/"
  assume_role_policy = data.template_file.k8s_pod_assume_role_policy.rendered
}

resource "aws_iam_role" "whalebirdsocial_prd_pod_role" {
  name               = "whalebirdsocial-prd-pod-role"
  path               = "/"
  assume_role_policy = data.template_file.k8s_pod_assume_role_policy.rendered
}

resource "aws_iam_role" "pleromaio_prd_pod_role" {
  name               = "pleromaio-prd-pod-role"
  path               = "/"
  assume_role_policy = data.template_file.k8s_pod_assume_role_policy.rendered
}

resource "aws_iam_role" "seiyuwatch_prd_pod_role" {
  name               = "seiyuwatch-prd-pod-role"
  path               = "/"
  assume_role_policy = data.template_file.k8s_pod_assume_role_policy.rendered
}
