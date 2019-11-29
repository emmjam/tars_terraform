data "aws_iam_policy_document" "assume_readonly_role_developer" {
  statement {
    sid    = "AllowAssumeReadOnlyRoleDeveloper"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/ReadOnlyDeveloper",
      "arn:aws:iam::246976497890:role/ReadOnlyDeveloper"
    ]
  }
}
