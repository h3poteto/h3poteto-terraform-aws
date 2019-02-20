resource "aws_spot_fleet_request" "eks_node" {
  iam_fleet_role                      = "${data.terraform_remote_state.aws_iam.spot_fleet_role_arn}"
  spot_price                          = "${var.max_spot_price}"
  target_capacity                     = "${var.spot_target_capacity}"
  valid_until                         = "${var.spot_valid_until}"
  allocation_strategy                 = "${var.spot_allocation_strategy}"
  terminate_instances_with_expiration = true
  replace_unhealthy_instances         = true

  lifecycle {
    ignore_changes = ["target_capacity"]
  }

  launch_specification {
    instance_type          = "t3.medium"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_1_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 2
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "t3.large"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_2_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 2
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "t3.xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_3_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 4
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "t3.2xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_1_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 8
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m4.large"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_2_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 2
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m4.xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_3_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 4
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m5.large"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_1_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 2
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m5.xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_2_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 4
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m3.medium"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_3_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 1
    spot_price             = "0.0137"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m3.large"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_1_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 2
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m3.xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_2_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 4
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }

  launch_specification {
    instance_type          = "m3.2xlarge"
    ami                    = "${var.ami}"
    key_name               = "${var.key_name}"
    placement_tenancy      = "default"
    iam_instance_profile   = "${data.terraform_remote_state.aws_iam.eks_node_instance_profile_name}"
    subnet_id              = "${data.terraform_remote_state.aws_vpc_tokyo.public_subnet_3_id}"
    user_data              = "${data.template_file.user_data.rendered}"
    vpc_security_group_ids = ["${aws_security_group.base_node.id}"]
    weighted_capacity      = 8
    spot_price             = "0.02735"

    root_block_device {
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
    }

    tags {
      Name      = "${var.namespace}-eks-node-${var.env}"
      namespace = "${var.namespace}"
      role      = "eks-node"
      env       = "${var.env}"
      tfstate   = "${var.tfstate}"
    }
  }
}
