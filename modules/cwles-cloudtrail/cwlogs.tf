resource "aws_cloudwatch_log_group" "cloudtrail" {
  name = "${format(
    "%s-%s-%s/%s/%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "cloudtrail"
  )}"
}

resource "aws_cloudwatch_log_subscription_filter" "lambda_logstoes" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "cloudtrail"
  )}"

  log_group_name = "${format(
    "%s-%s-%s/%s/%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "cloudtrail"
  )}"

  filter_pattern  = ""
  destination_arn = "${var.cwles_logstoes_lambda_arn}"

  depends_on = [
    "aws_lambda_permission.logstoes_allow_cwlogs_cloudtrail",
  ]
}
