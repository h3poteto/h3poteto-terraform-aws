variable "service" {
  default = "seiyuwatch"
}

variable "env" {
  default = "prd"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "tfstate" {
  default = "services/seiyuwatch/prd/ap-northeast-1/terraform.tfstate"
}

variable "web_container_name" {
  default = "phoenix"
}

variable "web_container_port" {
  default = "8080"
}

variable "log_retention_in_days" {
  default = "60"
}

variable "seiyu_watch_host_zone_id" {
  default = "ZPE08ZJUUIWUT"
}
