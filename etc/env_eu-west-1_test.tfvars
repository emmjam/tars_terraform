##########
# GENERAL
##############################################################################
project     = "cvs"
environment = "test"
aws_region  = "eu-west-1"

default_tags = {
  Project     = "cvs"
  Environment = "test"
}

public_domain_name = "nonprod.cvs.dvsacloud.uk"

########
# WEBUI
##############################################################################

## S3
s3_bucket = {
  prefix             = "dvsa.cvs.webui"
  versioning_enabled = false
  force_destroy      = true
}

## LAMBDAS
atf_account_view = {
  memory_size            = 128
  timeout                = 10
  publish                = false
  cwlg_retention_in_days = 3
}

atf_account_view_env_vars = {
  NODE_ENV = "production"
  USERNAME = "demo"
  PASSWORD = "demo"
}

atf_account_view_app_secret = "salt"
