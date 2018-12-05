resource "aws_cloudwatch_log_group" "web" {
  name              = "${var.service}/web/${var.env}"
  retention_in_days = "${var.log_retention_in_days}"

  tags {
    Name    = "${var.service}/web/${var.env}"
    service = "${var.service}"
    role    = "web"
    env     = "${var.env}"
    tfstate = "${var.tfstate}"
  }
}
