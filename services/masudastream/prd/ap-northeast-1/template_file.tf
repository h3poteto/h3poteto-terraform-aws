data "template_file" "web_container_definition" {
  template = "${file("${path.module}/container_definitions/web.json.tpl")}"

  vars {
    container_image = "${data.terraform_remote_state.aws_ecr_tokyo.masudastream_url}:latest"
    container_name  = "${var.web_container_name}"
    container_port  = "${var.web_container_port}"
    service         = "${var.service}"
    role            = "web"
    env             = "${var.env}"
    region          = "${var.region}"
  }
}

data "template_file" "task_container_definition" {
  template = "${file("${path.module}/container_definitions/task.json.tpl")}"

  vars {
    container_image = "${data.terraform_remote_state.aws_ecr_tokyo.masudastream_url}:latest"
    service         = "${var.service}"
    role            = "web"
    env             = "${var.env}"
    region          = "${var.region}"
  }
}
