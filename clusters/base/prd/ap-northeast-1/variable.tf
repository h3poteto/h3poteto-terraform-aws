variable "namespace" {
  default = "base"
}

variable "env" {
  default = "prd"
}

variable "tfstate" {
  default = "clusters/base/prd/ap-northeast-1/terraform.tfstate"
}
