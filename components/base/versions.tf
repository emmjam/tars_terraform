
terraform {
  required_version = ">= 0.14"
  required_providers {
    archive = {
      source = "hashicorp/archive"
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
