data "aws_iam_policy_document" "assume_mgmtlive_readonly_ssm_access_no_secrets" {
  statement {
    sid    = "AllowAssumeMgmtLiveReadOnlySSMAccessNoSecrets"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::645711882182:role/ReadOnlySSMSessionNoSecrets",
      "arn:aws:iam::246976497890:role/ReadOnlySSMSessionNoSecrets"
    ]
  }
}