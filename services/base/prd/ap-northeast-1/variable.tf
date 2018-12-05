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
  default = "ami-0041c416aa23033a2" # amzn-ami-2018.03.e-amazon-ecs-optimized
}
