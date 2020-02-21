resource "aws_cloudwatch_event_target" "guardduty_slack" {
  rule = "${aws_cloudwatch_event_rule.guardduty_slack.name}"
  arn  = "${aws_lambda_function.guardduty_slack.arn}"
}

resource "aws_cloudwatch_event_target" "guardduty_opsgenie" {
  rule = "${aws_cloudwatch_event_rule.guardduty_opsgenie.name}"
  arn  = "${aws_sns_topic.guardduty_opsgenie.arn}"
}
