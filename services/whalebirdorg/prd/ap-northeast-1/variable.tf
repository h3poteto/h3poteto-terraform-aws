variable "service" {
  default = "whalebirdorg"
}

variable "env" {
  default = "prd"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "tfstate" {
  default = "services/whalebirdorg/prd/ap-northeast-1/terraform.tfstate"
}

variable "web_container_name" {
  default = "web"
}

variable "web_container_port" {
  default = "3000"
}

variable "log_retention_in_days" {
  default = "60"
}

variable "whalebird_org_host_zone_id" {
  default = "Z13GST5UDMNVY7"
}
