variable "service" {
  default = "pleroma"
}

variable "env" {
  default = "prd"
}

variable "tfstate" {
  default = "services/pleroma/prd/ap-northeast-1/terraform.tfstate"
}

variable "pleroma_io_host_zone_id" {
  default = "Z3V8HXIOT2HTUD"
}

variable "alb_dns_name" {
  default = "a5a91729-webpublic-albingr-4676-26761550.ap-northeast-1.elb.amazonaws.com"
}

variable "alb_hosted_zone_id" {
  default = "Z14GRHDCWA56QT"
}

