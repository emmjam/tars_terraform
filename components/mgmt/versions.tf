terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.36.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
  required_version = ">= 1.2"
}
