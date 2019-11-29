data "aws_iam_policy_document" "assume_readonly_role_appsupport" {
  statement {
    sid    = "AllowAssumeReadonlyRoleAppSupport"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/ReadOnlyAppSupport",
      "arn:aws:iam::246976497890:role/ReadOnlyAppSupport"
    ]
  }
}
