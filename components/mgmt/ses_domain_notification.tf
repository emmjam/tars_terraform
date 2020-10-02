
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
  identity          = data.terraform_remote_state.ctrl.outputs.tars_domain_name
}

resource "aws_ses_identity_notification_topic" "ses_bounces" {
  topic_arn         = aws_sns_topic.ses_bounces.arn
  notification_type = "Bounce"
  identity          = data.terraform_remote_state.ctrl.outputs.tars_domain_name
}
