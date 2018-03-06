module "vts" {
  source = "../../modules/cvs-terraform/vts"

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
  bucket_prefix             = "${lookup(var.vts_s3_bucket,"prefix")}"
  bucket_versioning_enabled = "${lookup(var.vts_s3_bucket,"versioning_enabled")}"
  bucket_force_destroy      = "${lookup(var.vts_s3_bucket,"force_destroy")}"

  # VTS LAMBDA
  vts_s3_key                 = "${var.vts_s3_key}"
  vts_env_vars               = "${var.vts_env_vars}"
  vts_memory_size            = "${lookup(var.vts,"memory_size")}"
  vts_timeout                = "${lookup(var.vts,"timeout")}"
  vts_publish                = "${lookup(var.vts,"publish")}"
  vts_cwlg_retention_in_days = "${lookup(var.vts,"cwlg_retention_in_days")}"

  # APIG Authoriser
  authorizer_id = "${var.vts_authorizer_id}"
}
