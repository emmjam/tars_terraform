data "aws_iam_policy_document" "assume_readonly_no_secrets_role_nonprod" {
  statement {
    sid    = "AllowAssumeReadOnlyNoSecretsRoleNonProd"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/ReadOnlyNoSecrets",
    ]
  }
}
