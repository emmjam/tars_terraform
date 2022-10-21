
terraform {
  required_version = ">= 1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.65.0"
      #version = "4.36.0"
    }
  }
}
