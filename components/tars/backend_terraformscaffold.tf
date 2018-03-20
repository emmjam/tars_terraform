terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "tars-terraformscaffold-652856684323-eu-west-1"
    key    = "tars/652856684323/eu-west-1/opsdev/tars.tfstate"
  }
}
