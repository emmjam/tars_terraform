# The code below does not work there is a bug with the tf 0.12.29 where the count value is not populated correctly. 
# according to tf gitlab, it was opened in June 2020 and still has not been resolved.
# Taking out count is not an option because it has issues with the tuple / index count of the resources 
# This is why this code is hashed out and at somepoint may be fixed.  

/*
resource "aws_lambda_permission" "ses_notifications" {
  count = var.enabled == "0" ? "0" : length(var.sns_topic_arns)

  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ses_notifications.arn
  principal     = "sns.amazonaws.com"
  source_arn    = element(var.sns_topic_arns, count.index)
}

resource "aws_lambda_permission" "ses_report" {
  count = var.enabled

  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ses_report.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ses-bounced-email-report.arn
}

*/

resource "aws_lambda_permission" "ses_notifications_complaints" {
  count = var.enable_bounced_email

  action        = "lambda:InvokeFunction"
  function_name = "arn:aws:lambda:eu-west-1:${var.aws_account_id}:function:ses-bounced-email-notifications"
  principal     = "sns.amazonaws.com"
  source_arn    = "arn:aws:sns:eu-west-1:${var.aws_account_id}:SES_complaints"
}

resource "aws_lambda_permission" "ses_notifications_bounces" {
  count = var.enable_bounced_email

  action        = "lambda:InvokeFunction"
  function_name = "arn:aws:lambda:eu-west-1:${var.aws_account_id}:function:ses-bounced-email-notifications"
  principal     = "sns.amazonaws.com"
  source_arn    = "arn:aws:sns:eu-west-1:${var.aws_account_id}:SES_bounces"
}

resource "aws_lambda_permission" "ses_report" {
  count = var.enable_bounced_email

  action        = "lambda:InvokeFunction"
  function_name = "arn:aws:lambda:eu-west-1:${var.aws_account_id}:function:ses-bounced-email-report"
  principal     = "events.amazonaws.com"
  source_arn    = "arn:aws:events:eu-west-1:${var.aws_account_id}:rule/${var.project}-${var.environment}-${var.component}-ses-bounced-email-report"
}
