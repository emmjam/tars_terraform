terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.65.0"
      #version = "4.36.0"
    }
  }
  required_version = ">= 1.0"
}
