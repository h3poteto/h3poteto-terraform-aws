variable "service" {}

variable "role" {}

variable "env" {}

variable "region" {}

variable "tfstate" {}

/*
 VPC
*/
variable "vpc_id" {}

variable "subnet_ids" {
  type = "list"
}

/*
 SpotFleet
*/
variable "iam_fleet_role_arn" {}

variable "max_spot_price" {
  default = "0.1"
}

variable "spot_target_capacity" {
  default = "0"
}

variable "spot_valid_until" {
  default = "2020-11-04T20:44:20Z"
}

variable "spot_allocation_strategy" {
  default = "diversified"
}

/*
 EC2Instance
*/
variable "ec2_instance_profile_name" {}

variable "key_name" {}

variable "ami" {}

variable "volume_size" {
  default = "30"
}

variable "alb_security_group_id" {}

variable "ssh_from_cidr" {}

/*
 ECS
*/
variable "ecs_task_cleanup_wait_duration" {
  default = "5m"
}

/*
 AutoscalingGroup
*/
variable "instance_type" {
  default = "t3.medium"
}

variable "ec2_instance_profile_arn" {}

variable "max_size" {
  default = 8
}

variable "min_size" {
  default = 0
}
