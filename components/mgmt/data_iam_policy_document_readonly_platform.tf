data "aws_iam_policy_document" "assume_readonly_role_platform" {
  statement {
    sid    = "AllowAssumereadonlyRolePlatform"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ReadOnlyPlatform",
      "arn:aws:iam::652856684323:role/ReadOnlyPlatform",
      "arn:aws:iam::246976497890:role/ReadOnlyPlatform"
    ]
  }
}
