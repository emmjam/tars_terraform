# TODO: this is just a temporary policy
data "aws_iam_policy_document" "capita_users" {
  statement {
    sid    = "AllowCapita"
    effect = "Allow"

    actions = [
      "cloudwatch:*",
      "events:*",
      "logs:*",
    ]

    resources = [
      "*",
    ]
  }

}
