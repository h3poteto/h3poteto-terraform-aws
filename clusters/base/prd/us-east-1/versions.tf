terraform {
  required_version = ">= 0.15"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.39"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}
