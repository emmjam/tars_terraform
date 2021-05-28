module "keyaccessrotation" {
  source = "../../modules/lambda-cron-keyaccessrotation"

  project      = "${var.project}"
  environment  = "${var.environment}"
  component    = "${var.component}"
  default_tags = "${local.default_tags}"

  function_name       = "lambda_access_key_rotation"
  description         = "Lambda to notify users about old access keys and revoke them after a certain period"
  handler             = "lambda_access_key_rotation.lambda_handler"
  memory              = "128"
  runtime             = "python3.7"
  timeout             = "300"
  cwl_retention       = "90"
  publish             = "true"
  s3_key              = "${lookup(var.lambda_access_key_rotation_config, "lambda_access_key_rotation_s3_key")}"
  s3_bucket_name      = "${local.csi_global}-lambda-platform"
  iam_policy_document = "${data.aws_iam_policy_document.lambda_access_key_rotation.json}"
  schedule            = "${lookup(var.lambda_access_key_rotation_config, "cw_rule_schedule_expression")}"
  enabled             = "${lookup(var.lambda_access_key_rotation_config, "enabled", false)}"

  lambda_env_vars = {
    ACCOUNT_NAME        = "${var.aws_account_alias}"
    KEY_AGE_MAX_DAYS    = "${lookup(var.lambda_access_key_rotation_config, "key_age_max_days")}"
    TSS_EMAIL           = "${lookup(var.lambda_access_key_rotation_config, "tss_email")}"
    VERIFIED_EMAIL      = "${lookup(var.lambda_access_key_rotation_config, "verified_email")}"
    WARNING_PERIOD_DAYS = "${lookup(var.lambda_access_key_rotation_config, "warning_period_days")}"
  }
}