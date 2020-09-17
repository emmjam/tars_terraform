resource "aws_cloudwatch_event_target" "ses-bounced-email-report" {
  count = var.enable_bounced_email_report
  rule = aws_cloudwatch_event_rule.ses-bounced-email-report[count.index].name
  arn  = aws_lambda_function.ses_report[count.index].arn
}