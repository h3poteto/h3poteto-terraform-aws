data "terraform_remote_state" "aws_vpc_tokyo" {
  backend = "s3"

  config {
    bucket = "h3poteto-terraform-state"
    key    = "aws-accounts/vpc/ap-northeast-1/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "aws_iam" {
  backend = "s3"

  config {
    bucket = "h3poteto-terraform-state"
    key    = "aws-accounts/iam/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "aws_ecr_tokyo" {
  backend = "s3"

  config {
    bucket = "h3poteto-terraform-state"
    key    = "aws-accounts/ecr/ap-northeast-1/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "base_prd_tokyo" {
  backend = "s3"

  config {
    bucket = "h3poteto-terraform-state"
    key    = "services/base/prd/ap-northeast-1/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
