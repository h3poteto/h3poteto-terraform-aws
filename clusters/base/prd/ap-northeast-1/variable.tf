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
  default = "ami-0f0e8066383e7a2cb" # amazon-eks-node-1.11-v20190109
}

variable "key_name" {
  default = "h3poteto-aws-key"
}

variable "volume_size" {
  default = "50"
}
