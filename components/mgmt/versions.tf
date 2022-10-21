terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.65.0"
      #version = "4.36.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
  required_version = ">= 1.2"
}
