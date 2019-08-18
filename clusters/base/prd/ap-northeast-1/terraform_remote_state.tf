data "terraform_remote_state" "aws_vpc_tokyo" {
  backend = "s3"

  config = {
    bucket = "h3poteto-terraform-state"
    key    = "aws-accounts/vpc/ap-northeast-1/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

