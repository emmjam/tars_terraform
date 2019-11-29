data "aws_iam_policy_document" "assume_db_cw_users_role" {
  statement {
    sid    = "AllowAssumeDBCWUserRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/DBCWAccess",
      "arn:aws:iam::246976497890:role/DBCWAccess"
    ]
  }
}
