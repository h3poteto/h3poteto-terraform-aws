resource "aws_appautoscaling_target" "target" {
  service_namespace  = "ec2"
  resource_id        = "spot-fleet-request/${var.spot_fleet_request_id}"
  scalable_dimension = "ec2:spot-fleet-request:TargetCapacity"
  role_arn           = "${var.role_arn}"
  min_capacity       = "${var.min_capacity}"
  max_capacity       = "${var.max_capacity}"
}
