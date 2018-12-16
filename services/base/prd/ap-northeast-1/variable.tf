variable "service" {
  default = "base"
}

variable "role" {
  default = "default"
}

variable "env" {
  default = "prd"
}

variable "region" {
  default = "ap-norhteast-1"
}

variable "tfstate" {
  default = "services/base/prd/ap-northeast-1/terraform.tfstate"
}

variable "key_name" {
  default = "h3poteto-aws-key"
}

variable "ami" {
  default = "ami-05b296a384694dfa4" # amzn-ami-2018.03.i-amazon-ecs-optimized
}
