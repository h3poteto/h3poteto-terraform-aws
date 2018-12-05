module "autoscaling_group" {
  source               = "../autoscaling_group"
  service              = "${var.service}"
  role                 = "${var.role}"
  env                  = "${var.env}"
  tfstate              = "${var.tfstate}"
  subnet_ids           = "${var.subnet_ids}"
  ami                  = "${var.ami}"
  instance_type        = "${var.instance_type}"
  volume_size          = "${var.volume_size}"
  iam_instance_profile = "${var.ec2_instance_profile_arn}"
  key_name             = "${var.key_name}"
  user_data            = "${data.template_file.user_data.rendered}"
  security_group_ids   = ["${aws_security_group.instance.id}"]
  max_size             = "${var.max_size}"
  min_size             = "${var.min_size}"
}
