resource "aws_lambda_function" "ses_notifications" {
  count = var.enable_bounced_email

  description   = "SES SNS trigger that logs the message pushed to the SNS topic."
  function_name = "ses-bounced-email-notifications"
  role          = aws_iam_role.sesnotifications_lambda_basic_execution[count.index].arn
  handler       = "bounced_email_notifications.handler"
  runtime       = "nodejs12.x"
  publish       = false
  s3_bucket     = var.bounced_email_s3_bucket
  s3_key        = var.bounced_email_notifications_s3_key

  environment {
    variables = {
      record_expiry_days  = "30"
      dynamodb_table_name = aws_dynamodb_table.bounced_email_report[count.index].name
    }
  }

  tags = merge(
    var.default_tags,
    tomap({
      "Name" = format(
        "%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name
      ),
      "Module" = var.module
    })
  )
}

resource "aws_lambda_function" "ses_report" {
  count = var.enable_bounced_email

  description   = "Scheduled lambda to generate bounced email report"
  function_name = "ses-bounced-email-report"
  role          = aws_iam_role.sesreport_lambda_basic_execution[count.index].arn
  handler       = "bounced_email_report.handler"
  runtime       = "python3.8"
  publish       = false
  s3_bucket     = var.bounced_email_s3_bucket
  s3_key        = var.bounced_email_report_s3_key

   environment {
    variables = merge(
      tomap({
        "dynamodb_table_name" = aws_dynamodb_table.bounced_email_report[0].name
    }),
      var.ses_report_lambda_env_vars,
    )
  }

  tags = merge(
    var.default_tags,
    tomap({
      "Name" = format(
        "%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name
      ),
      "Module" = var.module
    })
  )
}
