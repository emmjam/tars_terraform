terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
  required_version = ">= 0.13"
}
