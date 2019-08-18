terraform {
  backend "s3" {
    bucket = "h3poteto-terraform-state"
    key    = "services/masudastream/prd/ap-northeast-1/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

