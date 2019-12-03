data "aws_iam_policy_document" "assume_readonly_role_dvsa" {
  statement {
    sid    = "AllowAssumeReadOnlyRoleDVSA"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/ReadOnlyNoSecrets",
      "arn:aws:iam::246976497890:role/ReadOnlyNoSecrets"
    ]
  }
}
