
terraform {
  required_version = ">= 1.0"
  required_providers {
    archive = {
      source = "hashicorp/archive"
      version = "2.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.50.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
}