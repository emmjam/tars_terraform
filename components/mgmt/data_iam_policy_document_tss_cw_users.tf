data "aws_iam_policy_document" "assume_tss_cw_users_role" {
  statement {
    sid    = "AllowAssumeTSSCWUserRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::246976497890:role/TSSCWAccess"
    ]
  }
}
