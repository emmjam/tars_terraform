
# SNS Topics
resource "aws_sns_topic" "ses_complaints" {
  count = var.enable_ses_sns == true ? 1 : 0
  name = "SES_complaints"
}

resource "aws_sns_topic" "ses_bounces" {
  count = var.enable_ses_sns == true ? 1 : 0
  name = "SES_bounces"
}

# Notifications
resource "aws_ses_identity_notification_topic" "ses_complaints" {
  count = var.enable_ses_sns == true ? 1 : 0
  topic_arn         = aws_sns_topic.ses_complaints[count.index].arn
  notification_type = "Complaint"
  identity          = aws_ses_domain_identity.tars[count.index].domain
}

resource "aws_ses_identity_notification_topic" "ses_bounces" {
  count = var.enable_ses_sns == true ? 1 : 0
  topic_arn         = aws_sns_topic.ses_bounces[count.index].arn
  notification_type = "Bounce"
  identity          = aws_ses_domain_identity.tars[count.index].domain
}
