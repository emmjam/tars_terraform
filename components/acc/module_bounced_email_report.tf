
module "lambda-bounced-email-report" {
  name           = "lambda-bounced-email-report"
  source         = "../../modules/lambda-bounced-email-report"
  aws_account_id = "${var.aws_account_id}"
  environment    = "${var.environment}"
  project        = "${var.project}"
  component      = "${var.component}"
  default_tags   = "${var.default_tags}"
  sns_topic_arns  = [
    "${data.remotestate.}",
    "${module.ses_send.sns_topic_arn_ses_complaints}",
  ]
  write_capacity = 1
  read_capacity  = 1
  hash_key       = "SESMessageId"
  range_key      = "SnsPublishTime"
  table_name     = "bounced_emails_table"
  bounced_email_s3_bucket            = "${aws_s3_bucket.lambda_platform.id}"
  bounced_email_report_s3_key        = "bounced-email-artefacts/SESBounceReport.zip"
  bounced_email_notifications_s3_key = "bounced-email-artefacts/SESNotifications.zip"
  enable_bounce_module = "${var.enable_bounced_email_report}"
}
