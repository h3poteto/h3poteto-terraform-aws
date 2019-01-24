resource "aws_iam_instance_profile" "asumibot_instance_profile" {
  name = "asumibotEC2Role"
  role = "${aws_iam_role.asumibot_ec2_role.name}"
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs-instance-profile"
  role = "${aws_iam_role.ecs_ec2_role.name}"
}

resource "aws_iam_instance_profile" "eks_node_profile" {
  name = "eks-node-profile"
  role = "${aws_iam_role.eks_node_role.name}"
}
