variable "service" {}

variable "env" {}

variable "tfstate" {}

variable "vpc_cidr_block" {}

variable "subnet_cidr_block" {
  default {
    subnet_1 = ""
    subnet_2 = ""
    subnet_3 = ""
  }
}

variable "availability_zone" {
  default {
    subnet_1 = "ap-northeast-1a"
    subnet_2 = "ap-northeast-1c"
    subnet_3 = "ap-northeast-1d"
  }
}
