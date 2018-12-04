resource "aws_iam_group_membership" "h3poteto_developers" {
  name  = "Developers"
  group = "${aws_iam_group.h3poteto_developers.name}"

  users = "${var.developers}"
}
