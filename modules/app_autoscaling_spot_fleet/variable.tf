variable "service" {}

variable "role" {}

variable "env" {}

variable "ecs_cluster_name" {}

variable "spot_fleet_request_id" {}

variable "role_arn" {}

variable "min_capacity" {
  default = 1
}

variable "max_capacity" {
  default = 10
}

# Scale-Out
variable "scale_out_cooldown" {
  default = 120
}

variable "scale_out_adjustment" {
  default = 1
}

# Scale-In
variable "scale_in_cooldown" {
  default = 300
}

variable "scale_in_adjustment" {
  default = -1
}

# Target metric
variable "metric" {
  default = "CPUUtilization"
}

# Alarm
# Scale-Out
variable "high_evaluation_periods" {
  default = "2"
}

variable "high_alarm_period" {
  default = "60"
}

variable "high_alarm_statistic" {
  default = "Maximum"
}

variable "high_threshold" {
  default = "60"
}

# Scale-In
variable "low_evaluation_periods" {
  default = "5"
}

variable "low_alarm_period" {
  default = "60"
}

variable "low_alarm_statistic" {
  default = "Maximum"
}

variable "low_threshold" {
  default = "40"
}
