data "aws_iam_policy_document" "readonly_ssm_session" {
  statement {
    sid    = "AllowSSMStartSession"
    effect = "Allow"

    actions = [
      "ssm:StartSession"
    ]

    resources = [
      "arn:aws:ec2:*:${var.aws_account_id}:instance/*",
    ]
  }

  statement {
    sid    = "AllowSSMTerminateSession"
    effect = "Allow"

    actions = [
      "ssm:TerminateSession"
    ]

    resources = [
      "arn:aws:ssm:*:*:session/$${aws:username}-*",
    ]
  }
}

