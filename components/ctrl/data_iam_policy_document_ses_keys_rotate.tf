data "aws_iam_policy_document" "ses_keys_rotate" {
  count = var.account_environment != "mgmt" ? 1 : 0

  statement {
    sid    = "GetfromS3"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "PerformIAMActions"
    effect = "Allow"

    actions = [
      "iam:ListUsers",
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:GetAccessKeyLastUsed",
      "iam:GetUser",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "PerformSSMActions"
    effect = "Allow"

    actions = [
      "ssm:PutParameter",
      "ssm:DeleteParameter",
      "ssm:DescribeParameters",
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter",
      "ssm:DeleteParameters"
    ]

    resources = [
      "*",
    ]
  }
}