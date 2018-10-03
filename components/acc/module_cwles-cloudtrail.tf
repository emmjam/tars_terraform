module "cwles_cloudtrail" {
  source = "../../modules/cwles-cloudtrail"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  aws_account_id = "${var.aws_account_id}"

  cwles_logstoes_es_domain_endpoint = "${module.cwles.es_domain_endpoint}"

  cwles_logstoes_lambda_arn = "${module.cwles.logstoes_lambda_arn}"
  s3_bucketlogs_bucket_id   = "${aws_s3_bucket.bucketlogs.id}"

  default_tags = "${local.default_tags}"
}
