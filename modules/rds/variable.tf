variable "service" {}

variable "env" {}

variable "tfstate" {}

variable "db_identifier" {}

variable "vpc_id" {}

variable "subnet_1_id" {}

variable "subnet_2_id" {}

variable "app_security_group_ids" {
  type = "list"
}

variable "db_instance_engine" {}

variable "db_instance_engine_version" {}

variable "db_instance_instance_class" {}

variable "db_instance_storage_type" {}

variable "db_instance_iops" {}

variable "db_instance_allocated_storage" {}

variable "db_instance_multi_az" {}

variable "db_port" {}

variable "db_username" {}

variable "db_password" {}

variable "db_instance_parameter_group" {}
