terraform {
  backend "s3" {
    bucket = "h3poteto-terraform-state"
    key    = "aws-accounts/iam/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
