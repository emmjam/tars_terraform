data "aws_iam_policy_document" "assume_readonly_role_tssops" {
  statement {
    sid    = "AllowAssumeReadOnlyRoleTSSOps"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    condition {
      test     = "StringLike"
      variable = "sts:RoleSessionName"
      values   = [
         "{aws:username}",
      ]
    }

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ReadOnly",
      "arn:aws:iam::652856684323:role/ReadOnly",
      "arn:aws:iam::246976497890:role/ReadOnly"
    ]
  }
}
