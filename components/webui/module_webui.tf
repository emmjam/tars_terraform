module "webui" {
  source = "../../modules/cvs-terraform/webui"

  # GENERAL
  project      = "${var.project}"
  environment  = "${var.environment}"
  component    = "${var.component}"
  aws_region   = "${var.aws_region}"
  default_tags = "${var.default_tags}"

  # DNS
  api_gateway_dns_alias = "${var.api_gateway_dns_alias}"
  public_domain_name    = "${var.public_domain_name}"
  acm_cert_prefix       = "${var.acm_cert_prefix}"

  # S3
  bucket_prefix             = "${lookup(var.s3_bucket,"prefix")}"
  bucket_versioning_enabled = "${lookup(var.s3_bucket,"versioning_enabled")}"
  bucket_force_destroy      = "${lookup(var.s3_bucket,"force_destroy")}"

  # ATF-ACCOUNT-VIEW LAMBDA
  atf_account_view_s3_key                 = "${var.atf_account_view_s3_key}"
  atf_account_view_env_vars               = "${var.atf_account_view_env_vars}"
  atf_account_view_app_secret             = "${var.atf_account_view_app_secret}"
  atf_account_view_memory_size            = "${lookup(var.atf_account_view,"memory_size")}"
  atf_account_view_timeout                = "${lookup(var.atf_account_view,"timeout")}"
  atf_account_view_publish                = "${lookup(var.atf_account_view,"publish")}"
  atf_account_view_cwlg_retention_in_days = "${lookup(var.atf_account_view,"cwlg_retention_in_days")}"
}
