data "aws_iam_policy_document" "sesnotification_lambda_policy" {
  count = var.enable_bounced_email

  statement {
    sid = "SESNotificationLogging"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = formatlist(
      "%s:*",
      flatten([
        aws_cloudwatch_log_group.ses-bounced-email-report[count.index].arn,
        aws_cloudwatch_log_group.ses-bounced-email-report[count.index].arn
      ])
    )
  }

  statement {
    sid = "SESNotificationDynamodb"
    actions = [
      "dynamodb:BatchGet*",
      "dynamodb:Desc*",
      "dynamodb:List*",
      "dynamodb:Get*",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:BatchWrite*",
      "dynamodb:UpdateItem",
      "dynamodb:PutItem",
    ]

    resources = [
      aws_dynamodb_table.bounced_email_report[count.index].arn
    ]
  }
}

data "aws_iam_policy_document" "sesreport_lambda_policy" {
  count = var.enable_bounced_email

  statement {
    sid = "SESReportSendMail"
    actions = [
      "ses:SendRawEmail",
    ]
    resources = [
      "arn:aws:ses:eu-west-1:${var.aws_account_id}:identity/prod.tars.dvsacloud.uk"
    ]
  }
  statement {
    sid = "SESReportLogging"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = formatlist("%s:*", flatten([
      aws_cloudwatch_log_group.ses-bounced-email-report[count.index][*].arn,
      aws_cloudwatch_log_group.ses-bounced-email-report[count.index].arn
    ]))
  }

  statement {
    sid = "SESReportDynamodb"
    actions = [
      "dynamodb:Scan",
      "dynamodb:Query",
      "dynamodb:Get*",
      "dynamodb:BatchGet*",
      "dynamodb:List*",
      "dynamodb:Desc*",
    ]
    resources = flatten([
      aws_dynamodb_table.bounced_email_report[count.index][*].arn,
      aws_dynamodb_table.bounced_email_report[count.index].arn
    ])
  }
}

