output "asumibot_instance_profile_name" {
  value = "${aws_iam_instance_profile.asumibot_instance_profile.name}"
}

output "ecs_instance_profile_arn" {
  value = "${aws_iam_instance_profile.ecs_instance_profile.arn}"
}

output "ecs_instance_profile_name" {
  value = "${aws_iam_instance_profile.ecs_instance_profile.name}"
}

output "ecs_service_role_arn" {
  value = "${aws_iam_role.ecs_service_role.arn}"
}

output "spot_fleet_role_arn" {
  value = "${aws_iam_role.spot_fleet_role.arn}"
}

output "ecs_events_role_arn" {
  value = "${aws_iam_role.ecs_events_role.arn}"
}

output "fascia_prd_ecs_task_role_arn" {
  value = "${aws_iam_role.fascia_prd_ecs_task_role.arn}"
}

output "whalebirdorg_prd_ecs_task_role_arn" {
  value = "${aws_iam_role.whalebirdorg_prd_ecs_task_role.arn}"
}

output "seiyuwatch_prd_ecs_task_role_arn" {
  value = "${aws_iam_role.seiyuwatch_prd_ecs_task_role.arn}"
}

output "masudastream_prd_ecs_task_role_arn" {
  value = "${aws_iam_role.masudastream_prd_ecs_task_role.arn}"
}

output "pleroma_prd_ecs_task_role_arn" {
  value = "${aws_iam_role.pleroma_prd_ecs_task_role.arn}"
}

output "eks_master_role_arn" {
  value = "${aws_iam_role.eks_master_role.arn}"
}

output "eks_node_role_arn" {
  value = "${aws_iam_role.eks_node_role.arn}"
}

output "eks_node_instance_profile_arn" {
  value = "${aws_iam_instance_profile.eks_node_profile.arn}"
}
