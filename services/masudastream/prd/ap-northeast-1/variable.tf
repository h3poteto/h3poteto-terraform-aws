variable "service" {
  default = "masudastream"
}

variable "env" {
  default = "prd"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "tfstate" {
  default = "services/masudastream/prd/ap-northeast-1/terraform.tfstate"
}

variable "web_container_name" {
  default = "uwsgi"
}

variable "web_container_port" {
  default = "8000"
}

variable "log_retention_in_days" {
  default = "60"
}

variable "masuda_stream_net_host_zone_id" {
  default = "ZVTGI4QQD1RAE"
}
