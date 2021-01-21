# TODO: adjust permissions based on real usage
data "aws_iam_policy_document" "builder" {
  statement {
    sid    = "AllowAccountManagement"
    effect = "Allow"

    actions = [
      "*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "DenyCreateUser"

    effect = "Deny"

    actions = [
      "iam:CreateUser"
    ]

    resources = [
      "*"
    ]
  }

}

