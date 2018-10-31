terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "tars-terraformscaffold-246976497890-eu-west-1"
    key    = "tars/246976497890/eu-west-1/prod/tars-core.tfstate"
  }
}
