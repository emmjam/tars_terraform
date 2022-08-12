resource "aws_lambda_function" "ses_keys_rotate" {
  count = var.account_environment != "mgmt" ? 1 : 0

  function_name = "ses-keys-rotate"
  runtime       = "python3.10"
  memory_size   = "128"
  handler       = "ses_keys_rotate.lambda_handler"
  timeout       = "60"
  publish       = false
  s3_bucket     = "tars-nonprod-ctrl-resources"
  s3_key        = "lambda-repo/packages/ses_keys_rotate/ses_keys_rotate.zip"

  environment {
    variables = {
      ENVIRONMENT = var.environment
    }
  }
}

resource "aws_cloudwatch_event_rule" "ses_keys_rotate_trigger" {
  # Run at 11am on the 1st day of every 3rd month (~roughly every 90 days)
  count               = var.account_environment != "mgmt" ? 1 : 0
  name                = "ses_keys_rotate"
  description         = "ses_keys_rotate"
  schedule_expression = "cron(0 11 1 */3 * *)"
}

resource "aws_cloudwatch_event_target" "ses_keys_rotate" {
  count = var.account_environment != "mgmt" ? 1 : 0
  rule  = aws_cloudwatch_event_rule.ses_keys_rotate_trigger[count.index].name
  arn   = aws_lambda_function.ses_keys_rotate[count.index].arn
}

resource "aws_lambda_permission" "allow_ses_rotate_cloudwatch" {
  count         = var.account_environment != "mgmt" ? 1 : 0
  statement_id  = "AllowExecutionFromCloudWatchSESKeyRotate"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ses_keys_rotate[count.index].function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ses_keys_rotate_trigger[count.index].arn
}

