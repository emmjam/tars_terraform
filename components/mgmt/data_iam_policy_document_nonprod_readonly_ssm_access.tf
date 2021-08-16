data "aws_iam_policy_document" "assume_nonprod_readonly_ssm_access" {
  statement {
    sid    = "AllowAssumeNonProdReadOnlySSMAccess"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/ReadOnlySSMSession"
    ]
  }
}
