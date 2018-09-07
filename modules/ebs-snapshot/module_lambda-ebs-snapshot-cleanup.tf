module "lambda_ebs_snapshot_cleanup" {
  source      = "../lambda-ebs-snapshot"
  name        = "${var.cleanup_name}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  s3_bucket = "${var.cleanup_s3_bucket}"
  s3_key    = "${var.cleanup_s3_key}"

  publish                = "${var.cleanup_publish}"
  memory_size            = "${var.cleanup_memory_size}"
  timeout                = "${var.cleanup_timeout}"
  cwlg_retention_in_days = "${var.cleanup_cwlg_retention}"

  runtime = "python2.7"
  handler = "ebs_snapshot_cleanup_lambda.lambda_handler"

  principal_service  = "events.amazonaws.com"
  invoker_source_arn = "${aws_cloudwatch_event_rule.ebs_snapshot_cleanup.arn}"

  env_variables = {
    aws_region              = "${var.aws_region}"
    snapshot_retention_days = "${var.snapshot_retention_days}"
    aws_account_id          = "${var.aws_account_id}"
    min_number_to_retain    = "${var.min_snapshots_per_vol}"
  }
}
