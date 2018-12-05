data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"

  vars {
    ecs_cluster           = "${aws_ecs_cluster.cluster.name}"
    cleanup_wait_duration = "${var.ecs_task_cleanup_wait_duration}"
  }
}
