variable "namespace" {
  default = "external"
}

variable "env" {
  default = "prd"
}

variable "tfstate" {
  default = "clusters/external/prd/ap-northeast-1/terraform.tfstate"
}
