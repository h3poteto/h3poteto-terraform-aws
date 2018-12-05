resource "aws_instance" "instance" {
  ami           = "${var.ami_id["ap-northeast-1"]}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  user_data     = "${data.template_file.userdata.rendered}"

  vpc_security_group_ids = [
    "${aws_security_group.security_group.id}",
    "${var.sub_security_group_ids}",
  ]

  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = "true"

  root_block_device = {
    volume_type = "gp2"
    volume_size = "${var.volume_size}"
  }

  iam_instance_profile = "${var.instance_profile_name}"

  tags {
    Name    = "${var.service}-${var.env}"
    service = "${var.service}"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
