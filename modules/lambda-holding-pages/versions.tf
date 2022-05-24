terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
    aws = {
      source = "hashicorp/aws"
      version = "3.50.0"
    }
  }
  required_version = ">= 1.0"
}
