terraform {
  backend "s3" {
    region = "ap-northeast-1"
    bucket = "h3poteto-terraform-state"
    key    = "aws-accounts/ecr/ap-northeast-1/terraform.tfstate"
  }
}

