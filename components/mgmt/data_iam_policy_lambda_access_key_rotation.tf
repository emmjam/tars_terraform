data "aws_iam_policy_document" "lambda_access_key_rotation" {
  statement {
    sid    = "keyRotateLambdaSendEmail"
    effect = "Allow"

    actions = [
      "ses:SendEmail",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "keyRotateLambdaIamAccess"
    effect = "Allow"

    actions = [
      "iam:ListUsers",
      "iam:ListAccessKeys",
      "iam:DeleteAccessKey",
    ]

    resources = [
      "*",
    ]
  }
}