resource "aws_iam_role" "iam_ses_lambda" {
  count = var.account_environment != "mgmt" ? 1 : 0
  name  = "iam_ses_lambda"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:ListUsers",
          "iam:CreateAccessKey",
          "iam:DeleteAccessKey",
          "iam:GetAccessKeyLastUsed",
          "iam:GetUser",
          "iam:ListAccessKeys",
          "iam:UpdateAccessKey"
        ]
        Effect   = "Allow"
        Sid      = ""
        Resource = "*"
      },
    ]
  })
}


# --------------------------------------------------------------------------- #
# Cloudwatch Log Group
# --------------------------------------------------------------------------- #

resource "aws_cloudwatch_log_group" "ses_key_rotate" {
  count             = var.account_environment != "mgmt" ? 1 : 0
  name              = "/aws/lambda/${aws_lambda_function.ses_key_rotate.function_name}"
  retention_in_days = "90"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ses_key_rotate"
    },
  )
}

# --------------------------------------------------------------------------- #
# Lambda Function
# --------------------------------------------------------------------------- #

resource "aws_lambda_function" "ses_key_rotate" {
  count            = var.account_environment != "mgmt" ? 1 : 0
  filename         = "${path.module}/files/ses_keys_rotate.zip"
  source_code_hash = filebase64sha256("${path.module}/files/ses_keys_rotate.zip")

  function_name = "ses_key_rotate"

  role        = aws_iam_role.iam_ses_lambda.arn[0]
  handler     = "ses_key_rotate.lambda_handler"
  runtime     = "python3.8"
  timeout     = "10"
  memory_size = "128"
}

# --------------------------------------------------------------------------- #
# Cloudwatch Events Rule
# --------------------------------------------------------------------------- #

resource "aws_cloudwatch_event_rule" "ses_key_rotate_trigger" {
  count       = var.account_environment != "mgmt" ? 1 : 0
  name        = "ses_key_rotate"
  description = "ses_key_rotate"
  # Run on the 1st of every 3rd month (roughly every 90 days)
  schedule_expression = "cron(0 12 1 */3 * *)"
}

resource "aws_cloudwatch_event_target" "ses_key_rotate" {
  count = var.account_environment != "mgmt" ? 1 : 0
  rule  = aws_cloudwatch_event_rule.ses_key_rotate_trigger.name
  arn   = aws_lambda_function.ses_key_rotate.arn
}

resource "aws_lambda_permission" "allow_ses_rotate_cloudwatch" {
  count         = var.account_environment != "mgmt" ? 1 : 0
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ses_key_rotate.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ses_key_rotate_trigger.arn
}