data "aws_iam_policy_document" "email_inspector_report" {
  count = var.kms_inspector_count
  statement {
    sid    = "GetfromS3"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.inspector_reports[0].arn,
      format(
        "%s%s",
        aws_s3_bucket.inspector_reports[0].arn,
        "/*",
      )
    ]
  }

  statement {
    sid    = "KMSDecrypt"
    effect = "Allow"

    actions = [
      "kms:Decrypt",
    ]

    resources = [
      "arn:aws:kms:eu-west-1:652856684323:key/83b07d97-6e65-42cb-97fd-21fe538e02b4",
    ]
  }

  statement {
    sid    = "SendEmailSES"
    effect = "Allow"

    actions = [
      "ses:SendRawEmail",
    ]

    resources = [
      "*",
    ]
  }
}