terraform {
  required_version = ">= 0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.39"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.1"
    }
  }
}
