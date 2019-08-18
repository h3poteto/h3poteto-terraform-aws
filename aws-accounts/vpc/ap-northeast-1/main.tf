module "vpc" {
  source  = "../../../modules/vpc"
  service = var.service
  env     = "prd"
  tfstate = var.tfstate

  vpc_cidr_block = "10.0.0.0/16"

  public_subnet_1_cidr = "10.0.0.0/20"
  public_subnet_2_cidr = "10.0.16.0/20"
  public_subnet_3_cidr = "10.0.32.0/20"


  private_subnet_1_cidr = "10.0.48.0/20"
  private_subnet_2_cidr = "10.0.64.0/20"
  private_subnet_3_cidr = "10.0.80.0/20"


  subnet_1_az = "ap-northeast-1a"
  subnet_2_az = "ap-northeast-1c"
  subnet_3_az = "ap-northeast-1d"

}

