provider "aws" {
  region = "${var.aws_region}"
  version = "1.50.0"
}

provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
  version = "1.50.0"
}