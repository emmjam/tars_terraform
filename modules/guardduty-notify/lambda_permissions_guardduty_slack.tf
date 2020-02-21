resource "aws_lambda_permission" "lambda_cloudwatch_guardduty_slack" {
  # All statement IDs per lambda function must be unique
  statement_id = "AllowGuarddutyToTriggerGuartdutyToSlackLambda"

  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.guardduty_slack.arn}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.guardduty_slack.arn}"
}
