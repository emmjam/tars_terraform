resource "aws_lambda_function" "ses_keys_rotate" {
  count = var.account_environment != "mgmt" ? 1 : 0

  function_name = "ses_keys_rotate"
  description   = "SES key rotation every 90 days"
  runtime       = "python3.8"
  memory_size   = "128"
  handler       = "ses_keys_rotate.lambda_handler"
  timeout       = "120"
  publish       = false
  s3_bucket     = "tars-nonprod-ctrl-resources"
  s3_key        = "lambda-repo/packages/ses_keys_rotate/ses_keys_rotate.zip"
  role          = aws_iam_role.ses_keys_rotate.arn

  environment {
    variables = {
      ENVIRONMENT = var.environment
      SEND_EMAIL = var.ses_rotate_send_email
      SES_RENEWAL_DAYS = var.ses_rotate_days
    }
  }
}

resource "aws_cloudwatch_event_rule" "ses_keys_rotate_trigger" {
  count               = var.account_environment != "mgmt" ? 1 : 0
  name                = "ses_keys_rotate"
  description         = "ses_keys_rotate"
  schedule_expression = "rate(90 days)"
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


resource "aws_cloudwatch_log_group" "ses_keys_rotate" {
  count             = var.account_environment != "mgmt" ? 1 : 0
  name              = "/aws/lambda/${aws_lambda_function.ses_keys_rotate[count.index].function_name}"
  retention_in_days = 180

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s/%s",
        var.project,
        var.environment,
        "ses_keys_rotate"
      )
    },
  )
}
