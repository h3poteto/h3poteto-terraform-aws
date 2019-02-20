resource "aws_iam_instance_profile" "asumibot_instance_profile" {
  name = "asumibotEC2Role"
  role = "${aws_iam_role.asumibot_ec2_role.name}"
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs-instance-profile"
  role = "${aws_iam_role.ecs_ec2_role.name}"
}

resource "aws_iam_instance_profile" "k8s_master_profile" {
  name = "k8s-master-profile"
  role = "${aws_iam_role.k8s_master_role.name}"
}

resource "aws_iam_instance_profile" "k8s_node_profile" {
  name = "k8s-node-profile"
  role = "${aws_iam_role.k8s_node_role.name}"
}
