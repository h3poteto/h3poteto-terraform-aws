data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.tpl")}"

  vars {
    service         = "${var.service}"
    env             = "${var.env}"
    node_name       = "${var.service}-${var.env}"
    env_bucket_path = "${var.env_bucket_path}"
    kms_key_id      = "${var.kms_key_id}"
    custom_commands = "${var.custom_commands}"
    ruby_version    = "${var.ruby_version}"
  }
}
