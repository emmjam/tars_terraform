data "aws_iam_policy_document" "key" {
  policy_id = format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    var.name,
    "key",
  )

  statement {
    sid    = "EnableIAMUserPermissions"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          data.aws_caller_identity.current.account_id,
          "root",
        ),
      ]
    }

    actions = [
      "kms:*",
    ]

    resources = [
      "*",
    ]
  }
}

