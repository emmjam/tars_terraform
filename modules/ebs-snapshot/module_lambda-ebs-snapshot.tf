module "lambda_ebs_snapshot" {
  source      = "../lambda-ebs-snapshot"
  name        = "${var.snapshot_name}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  s3_bucket              = "${var.snapshot_s3_bucket}"
  s3_key                 = "${var.snapshot_s3_key}"

  publish                = "${var.publish}"
  memory_size            = "${var.memory_size}"
  timeout                = "${var.timeout}"
  cwlg_retention_in_days = "${var.cwlg_retention}"

  runtime = "python2.7"
  handler = "ebs_snapshot_lambda.lambda_handler"

  principal_service  = "events.amazonaws.com"
  invoker_source_arn = "${aws_cloudwatch_event_rule.ebs_snapshot.arn}"

  env_variables = {
    aws_region   = "${var.aws_region}"
    node_types   = "${join(",", var.node_types)}"
    environments = "${join(",", var.environments)}"
  }
}
