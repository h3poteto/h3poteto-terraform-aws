resource "aws_launch_configuration" "as_conf" {
  image_id             = "${var.ami}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${var.iam_instance_profile}"
  key_name             = "${var.key_name}"
  security_groups      = ["${var.security_group_ids}"]
  user_data            = "${var.user_data}"
  spot_price           = "${var.spot_price}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.volume_size}"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
