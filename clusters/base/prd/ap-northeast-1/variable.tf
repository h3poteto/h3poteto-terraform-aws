variable "namespace" {
  default = "base"
}

variable "env" {
  default = "prd"
}

variable "tfstate" {
  default = "clusters/base/prd/ap-northeast-1/terraform.tfstate"
}

variable "ami" {
  default = "ami-08727f352c823c2a0" # amazon-eks-node-v25
}

variable "key_name" {
  default = "h3poteto-aws-key"
}

variable "volume_size" {
  default = "50"
}

variable "max_spot_price" {
  default = "0.1"
}

variable "spot_target_capacity" {
  default = "2"
}

variable "spot_valid_until" {
  default = "2020-11-04T20:44:20Z"
}

variable "spot_allocation_strategy" {
  default = "diversified"
}
