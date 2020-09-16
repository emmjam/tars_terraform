data "aws_iam_policy_document" "assume_administrators_role_platform_nonprod" {
  statement {
    sid    = "AllowAssumeAdministratorsRolePlatformNonProd"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/Administrators",
    ]
  }
}
