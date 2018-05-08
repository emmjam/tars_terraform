# A CloudWatch Events rule to initiate curation on a daily basis
resource "aws_cloudwatch_event_rule" "curator_daily" {
  name = "${format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "curator",
    "daily"
  )}"

  description         = "Execute the cwles curator lambda function once daily"
  schedule_expression = "rate(1 day)"
}

# Targeting the Curator Lambda function from the Cloudwatch Events rule
resource "aws_cloudwatch_event_target" "curator_daily" {
  rule = "${aws_cloudwatch_event_rule.curator_daily.name}"

  target_id = "${format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "curator",
    "daily"
  )}"

  arn = "${aws_lambda_function.curator.arn}"
}

# Configuring the Curator Lambda function to permit invocation from the Cloudwatch Events rule
resource "aws_lambda_permission" "curator_allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatchLogsEvents"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.curator.arn}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.curator_daily.arn}"
}
