module "ses_key_rotate" {
  source = "../../modules/lambda"

  count = var.account_environment != "mgmt" ? 1 : 0

  project     = var.project
  component   = var.component
  environment = var.environment
  env_variables = {
    ENVIRONMENT = var.environment
  }

  s3_bucket = "tars-nonprod-ctrl-resources"
  s3_key    = "lambda-repo/packages/ses_key_rotate/ses_key_rotate.zip"

  name        = "ses-key-rotate"
  runtime     = "python3.10"
  memory_size = "128"
  handler     = "ses_key_rotate.lambda_handler"
  timeout     = "10"
  publish     = false

  cwlg_retention_in_days = "90"
}

# --------------------------------------------------------------------------- #
# Cloudwatch Events Rule
# --------------------------------------------------------------------------- #

resource "aws_cloudwatch_event_rule" "ses_key_rotate_trigger" {
  # Run at 11am on the 1st day of every 3rd month (~roughly every 90 days)
  count       = var.account_environment != "mgmt" ? 1 : 0
  name        = "ses_key_rotate"
  description = "ses_key_rotate"
  schedule_expression = "cron(0 11 1 */3 * *)"
}

resource "aws_cloudwatch_event_target" "ses_key_rotate" {
  count = var.account_environment != "mgmt" ? 1 : 0
  rule  = aws_cloudwatch_event_rule.ses_key_rotate_trigger[count.index].name
  arn   = aws_lambda_function.ses_key_rotate[count.index].arn
}

resource "aws_lambda_permission" "allow_ses_rotate_cloudwatch" {
  count         = var.account_environment != "mgmt" ? 1 : 0
  statement_id  = "AllowExecutionFromCloudWatchSESKeyRotate"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ses_key_rotate[count.index].function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ses_key_rotate_trigger[count.index].arn
}