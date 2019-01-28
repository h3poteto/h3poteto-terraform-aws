resource "aws_iam_role" "asumibot_ec2_role" {
  name               = "asumibotEC2Role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ec2_assume_role_policy.json")}"
}

/*
 ECS
*/
resource "aws_iam_role" "ecs_ec2_role" {
  name               = "ecs-ec2-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ec2_assume_role_policy.json")}"
}

resource "aws_iam_role" "ecs_service_role" {
  name               = "ecs-service-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ecs_assume_role_policy.json")}"
}

resource "aws_iam_role" "spot_fleet_role" {
  name               = "spot-fleet-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/spot_fleet_assume_role_policy.json")}"
}

resource "aws_iam_role" "ecs_events_role" {
  name               = "ecs-events-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/events_assume_role_policy.json")}"
}

/*
 ECS Task Role
*/
resource "aws_iam_role" "fascia_prd_ecs_task_role" {
  name               = "fascia-prd-ecs-task-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ecs_task_assume_role_policy.json")}"
}

resource "aws_iam_role" "whalebirdorg_prd_ecs_task_role" {
  name               = "whalebirdorg-prd-ecs-task-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ecs_task_assume_role_policy.json")}"
}

resource "aws_iam_role" "seiyuwatch_prd_ecs_task_role" {
  name               = "seiyuwatch-prd-ecs-task-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ecs_task_assume_role_policy.json")}"
}

resource "aws_iam_role" "masudastream_prd_ecs_task_role" {
  name               = "masudastream-prd-ecs-task-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ecs_task_assume_role_policy.json")}"
}

resource "aws_iam_role" "pleroma_prd_ecs_task_role" {
  name               = "pleroma-prd-ecs-task-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ecs_task_assume_role_policy.json")}"
}

/*
 EKS
*/
resource "aws_iam_role" "eks_master_role" {
  name               = "eks-master-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/eks_assume_role_policy.json")}"
}

resource "aws_iam_role" "eks_node_role" {
  name               = "eks-node-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ec2_assume_role_policy.json")}"
}

resource "aws_iam_role" "fascia_prd_pod_role" {
  name               = "fascia-prd-pod-role"
  path               = "/"
  assume_role_policy = "${data.template_file.eks_pod_assume_role_policy.rendered}"
}
