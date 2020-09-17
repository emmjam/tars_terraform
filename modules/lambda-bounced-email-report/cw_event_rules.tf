resource "aws_cloudwatch_event_rule" "ses-bounced-email-report" {
  count = var.enable_bounced_email_report
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "ses-bounced-email-report"
  )

  description         = "SES Bounced Email Report"
  schedule_expression = "cron(0 9 ? * MON *)"
}