resource "aws_cloudwatch_log_subscription_filter" "lambda_app_logstoes" {
  count = "${length(var.logs_list)}"
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    element(var.logs_list,count.index)
  )}"

  log_group_name = "${element(var.logs_list,count.index)
  }"

  filter_pattern  = ""
  destination_arn = "${module.cwles.logstoes_lambda_arn}"

}

resource "aws_lambda_permission" "logstoes_allow_cwlogs_app_cloudtrail" {
  count = "${length(var.logs_list)}"
  statement_id  = "AllowExecutionFromCWLogsCloudTrail${count.index}"
  action        = "lambda:InvokeFunction"
  function_name = "${module.cwles.logstoes_lambda_arn}"

  principal = "${format(
    "logs.%s.amazonaws.com",
    var.aws_region
  )}"

  source_arn = "${format(
    "arn:aws:logs:%s:%s:log-group:%s:*",
    var.aws_region,
    var.aws_account_id,
    element(var.logs_list,count.index))}"
}

