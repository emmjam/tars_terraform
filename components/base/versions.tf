
terraform {
  required_version = ">= 1.2"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.65.0"
      #version = "4.36.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
}