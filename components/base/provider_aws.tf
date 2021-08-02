provider "aws" {
  region  = var.aws_region
  version = "3.50.0"
}

provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
  version = "3.50.0"
}

