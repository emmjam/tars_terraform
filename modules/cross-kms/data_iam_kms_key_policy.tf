data "aws_iam_policy_document" "key" {
  statement {
    sid    = "EnableIAMUserPermissions"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          645711882182,
          "root",
        ),
         "arn:aws:iam::652856684323:role/tars-nonprod-ctrl-jenkinsctrl-20180403122511377400000002"
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
