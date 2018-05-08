resource "aws_lambda_permission" "logstoes_allow_cwlogs_cloudtrail" {
  statement_id  = "AllowExecutionFromCWLogsCloudTrail"
  action        = "lambda:InvokeFunction"
  function_name = "${var.cwles_logstoes_lambda_arn}"

  principal = "${format(
    "logs.%s.amazonaws.com",
    data.aws_region.current.name
  )}"

  source_arn = "${aws_cloudwatch_log_group.cloudtrail.arn}"
}
