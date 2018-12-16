resource "aws_spot_fleet_request" "spot_fleet" {
  iam_fleet_role                      = "${var.iam_fleet_role_arn}"
  spot_price                          = "${var.max_spot_price}"
  target_capacity                     = "${var.spot_target_capacity}"
  valid_until                         = "${var.spot_valid_until}"
  allocation_strategy                 = "${var.spot_allocation_strategy}"
  terminate_instances_with_expiration = true
  replace_unhealthy_instances         = true

  lifecycle {
    ignore_changes = ["target_capacity"]
  }

  # subnet_idに${join(",", var.subnet_ids)}という渡し方は可能だが，それをやると裏側で勝手にsubnetの個数分のlaunch_specificationが自動生成される
  # するとapply後に差分となってしまうので，仕方なくsubnetごとにlaunch_specificationを作る
  launch_specification {
    instance_type          = "t3.small"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[0]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 1
    spot_price             = "0.0137"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "t3.medium"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[1]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 2
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "t3.large"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[2]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 2
    spot_price             = "0.0547"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "t3.xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[0]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 4
    spot_price             = "0.0547"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m4.large"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[1]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 2
    spot_price             = "0.0645"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m4.xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[2]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 4
    spot_price             = "0.0645"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m5.large"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[0]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 2
    spot_price             = "0.062"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m5.xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[1]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 4
    spot_price             = "0.062"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m3.medium"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[2]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 1
    spot_price             = "0.096"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m3.large"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[0]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 2
    spot_price             = "0.0965"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m3.xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[1]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 4
    spot_price             = "0.09625"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m3.2xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${var.ec2_instance_profile_name}"
    subnet_id              = "${var.subnet_ids[2]}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    weighted_capacity      = 8
    spot_price             = "0.09625"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name    = "${var.service}-${var.role}-${var.env}"
      service = "${var.service}"
      role    = "${var.role}"
      env     = "${var.env}"
      tfstate = "${var.tfstate}"
    }
  }
}
