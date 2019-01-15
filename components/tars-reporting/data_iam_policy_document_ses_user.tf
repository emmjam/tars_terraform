data "aws_iam_policy_document" "ses_user" {
  statement {
    effect = "Allow"

    actions = [
      "ses:SendRawEmail",
    ]

    resources = [
      "*",
    ]
  }
}

