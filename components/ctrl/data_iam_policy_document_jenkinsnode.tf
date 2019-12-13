# TODO: adjust permissions based on real usage
data "aws_iam_policy_document" "jenkinsnode" {
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
}

