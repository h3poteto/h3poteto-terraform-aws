data "terraform_remote_state" "aws_vpc_tokyo" {
  backend = "s3"

  config = {
    bucket = "h3poteto-terraform-state"
    key    = "aws-accounts/vpc/ap-northeast-1/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "us" {
  backend = "s3"

  config = {
    bucket = "h3poteto-terraform-state"
    key    = "clusters/base/prd/us-east-1/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
