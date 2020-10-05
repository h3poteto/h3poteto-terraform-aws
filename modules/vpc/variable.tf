variable "service" {}

variable "env" {}

variable "tfstate" {}

variable "vpc_cidr_block" {}

variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}
variable "public_subnet_3_cidr" {}

variable "private_subnet_1_cidr" {}
variable "private_subnet_2_cidr" {}
variable "private_subnet_3_cidr" {}

variable "subnet_1_az" {
  default = "ap-northeast-1a"
}

variable "subnet_2_az" {
  default = "ap-northeast-1c"
}

variable "subnet_3_az" {
  default = "ap-northeast-1d"
}

variable "cluster_name" {}
