variable "service" {}

variable "env" {}

variable "tfstate" {}

variable "replication_group_id" {}

variable "engine_version" {}

variable "node_type" {}

variable "num_cache_clusters" {}

variable "maintenace_window" {
  default = "sat:19:00-sat:20:00"
}

variable "availability_zones" {
  type = "list"
}

variable "vpc_id" {}

variable "subnet_1_id" {}

variable "subnet_2_id" {}

variable "ingress_security_group_ids" {
  type = "list"
}

variable "activerehashing" {
  description = "Apply rehashing or not. Allowed values: yes,no"
  default     = "yes"
}

variable "slowlog_log_slower_than" {
  description = "The execution time, in microseconds, to exceed in order for the command to get logged. Note that a negative number disables the slow log, while a value of zero forces the logging of every command. Allowed values: 0-"
  default     = "10000"
}

variable "slowlog_max_len" {
  description = "The length of the slow log. There is no limit to this length. Just be aware that it will consume memory. You can reclaim memory used by the slow log with SLOWLOG RESET. Allowed values: 0-"
  default     = "128"
}
