resource "aws_autoscaling_group" "asg" {
  name                 = "${var.service}-${var.role}-${var.env}"
  max_size             = "${var.max_size}"
  min_size             = "${var.min_size}"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  health_check_type    = "EC2"
  force_delete         = true
  vpc_zone_identifier  = ["${var.subnet_ids}"]
  desired_capacity     = 0

  lifecycle {
    ignore_changes = ["desired_capacity"]
  }

  tag {
    key                 = "Name"
    value               = "${var.service}-${var.role}-${var.env}"
    propagate_at_launch = true
  }

  tag {
    key                 = "service"
    value               = "${var.service}"
    propagate_at_launch = true
  }

  tag {
    key                 = "role"
    value               = "${var.role}"
    propagate_at_launch = true
  }

  tag {
    key                 = "env"
    value               = "${var.env}"
    propagate_at_launch = true
  }

  tag {
    key                 = "tfstate"
    value               = "${var.tfstate}"
    propagate_at_launch = true
  }

  tag {
    key                 = "${var.custom_tag_key}"
    value               = "${var.custom_tag_value}"
    propagate_at_launch = true
  }
}
