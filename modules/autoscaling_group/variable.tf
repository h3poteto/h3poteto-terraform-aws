variable "service" {}

variable "role" {}

variable "env" {}

variable "tfstate" {}

/*
 AutoscalingGroup
*/
variable "max_size" {
  default = 8
}

variable "min_size" {
  default = 0
}

variable "subnet_ids" {
  type = "list"
}

/*
 LaunchConfiguration
*/
variable "ami" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "iam_instance_profile" {}

variable "key_name" {}

variable "security_group_ids" {
  default = []
}

variable "user_data" {}

variable "volume_size" {
  default = "30"
}
