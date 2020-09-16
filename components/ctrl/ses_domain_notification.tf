
# SNS Topics
resource "aws_sns_topic" "ses_complaints" {
  name = "SES_complaints"
}

resource "aws_sns_topic" "ses_bounces" {
  name = "SES_bounces"
}

# Notifications
resource "aws_ses_identity_notification_topic" "ses_complaints" {
  topic_arn         = aws_sns_topic.ses_complaints.arn
  notification_type = "Complaint"
  identity          = aws_ses_domain_identity.tars.domain
}

resource "aws_ses_identity_notification_topic" "ses_bounces" {
  topic_arn         = aws_sns_topic.ses_bounces.arn
  notification_type = "Bounce"
  identity          = aws_ses_domain_identity.tars.domain
}
