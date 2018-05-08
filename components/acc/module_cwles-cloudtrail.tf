module "cwles_cloudtrail" {
  source = "../../modules/cwles-cloudtrail"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  aws_account_id = "${var.aws_account_id}"

  cwles_logstoes_lambda_arn = "${module.cwles.logstoes_lambda_arn}"
  s3_bucketlogs_bucket_id   = "${aws_s3_bucket.bucketlogs.id}"

  default_tags = "${merge(
    "${var.default_tags}",
    map(
      "Component", var.component
    )
  )}"
}
