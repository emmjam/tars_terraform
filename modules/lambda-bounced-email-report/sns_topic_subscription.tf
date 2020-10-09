# The code below does not work there is a bug with the tf 0.12.29 where the count value is not populated correctly. 
# according to tf gitlab, it was opened in June 2020 and still has not been resolved.
# Taking out count is not an option because it has issues with the tuple / index count of the resources 
# This is why this code is hashed out and at somepoint may be fixed.  

/*resource "aws_sns_topic_subscription" "sns_topic_subscription" {
  count = var.enabled == "0" ? "0" : length(var.sns_topic_arns)

  topic_arn                       = element(var.sns_topic_arns, count.index)
  protocol                        = "lambda"
  endpoint                        = aws_lambda_function.ses_notifications[count.index].arn
  raw_message_delivery            = "false"
}
*/

resource "aws_sns_topic_subscription" "sns_t_ses_bounces" {
  count                           = var.enabled
  topic_arn                       = "arn:aws:sns:eu-west-1:${var.aws_account_id}:SES_bounces"
  protocol                        = "lambda"
  endpoint                        = "arn:aws:lambda:eu-west-1:${var.aws_account_id}:function:ses-bounced-email-notifications"
  raw_message_delivery            = "false"
}

resource "aws_sns_topic_subscription" "sns_t_ses_complaints" {
  count                           = var.enabled  
  topic_arn                       = "arn:aws:sns:eu-west-1:${var.aws_account_id}:SES_complaints"
  protocol                        = "lambda"
  endpoint                        = "arn:aws:lambda:eu-west-1:${var.aws_account_id}:function:ses-bounced-email-notifications"
  raw_message_delivery            = "false"
}
