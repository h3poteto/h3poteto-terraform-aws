variable "service" {}

variable "role" {}

variable "env" {}

variable "tfstate" {}

variable "engine_version" {
  default = "5.0.0"
}

variable "node_type" {
  default = "cache.t2.micro"
}

variable "num_cache_clusters" {
  default = "1"
}

variable "maintenace_window" {
  default = "sat:19:00-sat:20:00"
}

variable "availability_zones" {
  type = "list"
}

variable "vpc_id" {}

variable "subnets" {
  type = "list"
}

variable "ingress_security_group_ids" {
  type = "list"
}
