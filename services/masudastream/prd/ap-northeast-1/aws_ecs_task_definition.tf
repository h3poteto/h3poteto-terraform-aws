resource "aws_ecs_task_definition" "web" {
  family                = "${var.service}-web-${var.env}"
  container_definitions = "${data.template_file.web_container_definition.rendered}"

  task_role_arn = "${data.terraform_remote_state.aws_iam.masudastream_prd_ecs_task_role_arn}"
  network_mode  = "bridge"
}

resource "aws_ecs_task_definition" "task" {
  family                = "${var.service}-web-${var.env}-task"
  container_definitions = "${data.template_file.task_container_definition.rendered}"

  task_role_arn = "${data.terraform_remote_state.aws_iam.masudastream_prd_ecs_task_role_arn}"
}
