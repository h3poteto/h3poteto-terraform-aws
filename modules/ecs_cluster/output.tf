output "instance_security_group_id" {
  value = "${aws_security_group.instance.id}"
}

output "ecs_cluster_id" {
  value = "${aws_ecs_cluster.cluster.id}"
}

output "ecs_cluster_arn" {
  value = "${aws_ecs_cluster.cluster.arn}"
}

output "ecs_cluster_name" {
  value = "${aws_ecs_cluster.cluster.name}"
}
