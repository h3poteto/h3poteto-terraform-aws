variable "service" {
  default = "pleroma"
}

variable "env" {
  default = "prd"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "tfstate" {
  default = "services/pleroma/prd/ap-northeast-1/terraform.tfstate"
}

variable "web_container_name" {
  default = "nginx"
}

variable "web_container_port" {
  default = "80"
}

variable "log_retention_in_days" {
  default = "60"
}

variable "pleroma_io_host_zone_id" {
  default = "Z3V8HXIOT2HTUD"
}
