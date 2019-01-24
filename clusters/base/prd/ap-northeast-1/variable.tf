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
