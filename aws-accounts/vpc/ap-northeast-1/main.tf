module "vpc" {
  source  = "../../../modules/vpc"
  service = "${var.service}"
  env     = "prd"
  tfstate = "${var.tfstate}"

  vpc_cidr_block = "10.0.0.0/16"

  public_subnet_cidr_block = {
    subnet_1 = "10.0.0.0/20"
    subnet_2 = "10.0.16.0/20"
    subnet_3 = "10.0.32.0/20"
  }

  private_subnet_cidr_block = {
    subnet_1 = "10.0.48.0/20"
    subnet_2 = "10.0.64.0/20"
    subnet_3 = "10.0.80.0/20"
  }

  availability_zone = {
    subnet_1 = "ap-northeast-1a"
    subnet_2 = "ap-northeast-1c"
    subnet_3 = "ap-northeast-1d"
  }
}
