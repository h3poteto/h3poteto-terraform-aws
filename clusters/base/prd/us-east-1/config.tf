terraform {
  backend "s3" {
    bucket = "h3poteto-terraform-state"
    key    = "clusters/base/prd/us-east-1/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

