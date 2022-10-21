
terraform {
  required_version = ">= 1.2"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.36.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
}