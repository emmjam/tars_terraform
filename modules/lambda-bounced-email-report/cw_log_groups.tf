resource "aws_cloudwatch_log_group" "ses-bounced-email-report" {
  count             = var.enable_bounced_email_report
  name              = "/aws/lambda/ses-bounced-email-report"
  retention_in_days = "60"
}

resource "aws_cloudwatch_log_group" "ses-bounced-email-notifications" {
  count             = var.enable_bounced_email_report
  name              = "/aws/lambda/ses-bounced-email-notifications"
  retention_in_days = "60"
}