data "aws_iam_policy_document" "assume_dms_users_role" {
  statement {
    sid    = "AllowAssumeDMSRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/DMSAccess",
      "arn:aws:iam::246976497890:role/DMSAccess"
    ]
  }
}
