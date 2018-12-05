variable "service" {
  default = "fascia"
}

variable "env" {
  default = "prd"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "tfstate" {
  default = "services/fascia/prd/ap-northeast-1/terraform.tfstate"
}

variable "web_container_name" {
  default = "go"
}

variable "web_container_port" {
  default = "9090"
}

variable "log_retention_in_days" {
  default = "60"
}

variable "fascia_io_host_zone_id" {
  default = "Z317685ECO8XFK"
}
