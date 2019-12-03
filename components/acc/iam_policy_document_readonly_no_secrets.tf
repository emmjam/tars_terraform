data "aws_iam_policy_document" "readonly_no_secrets" {
  statement {
    effect = "Deny"

    actions = [
      "kms:*",
      "ssm:*",
    ]

    resources = [
      "*",
    ]
  }
}

