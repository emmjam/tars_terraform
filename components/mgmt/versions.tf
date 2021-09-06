terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.50.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
  required_version = ">= 0.14"
}
