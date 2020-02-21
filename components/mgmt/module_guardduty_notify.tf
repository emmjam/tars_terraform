module "guardduty-notify" {
  source = "../../modules/guardduty-notify"

  project      = var.project
  environment  = var.environment
  component    = var.component
  default_tags = local.default_tags

  name        = "guardduty-slack"
  runtime     = "python3.6"
  handler     = "lambda_function.lambda_handler"
  timeout     = 3
  memory_size = 128

  # Guardduty alerts to Opsgenie config
  opsgenie_sns_topic_sub_create   = true
  opsgenie_sns_topic_sub_endpoint = lookup(var.guardduty_notify, "opsgenie_sns_topic_sub_endpoint")
  opsgenie_sns_topic_sub_protocol = "https"

  # Guardduty alerts to slack config
  cwlg_retention_in_days           = lookup(var.guardduty_notify, "cw_log_retention")
  encrypted_webhook_url            = lookup(var.guardduty_notify, "encrypted_webhook_url")
  lambda_guardduty_slack_s3_key    = lookup(var.guardduty_notify, "lambda_guardduty_slack_s3_key")
  lambda_platform_bucket           = module.lambda_platform_bucket.id
  platform_ops_kms_user_policy_arn = data.terraform_remote_state.acc.outputs.platform_ops_kms_key_user_policy_arn
}
