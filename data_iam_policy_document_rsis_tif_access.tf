data "aws_iam_policy_document" "assume_rsis_tif_access_role" {
  statement {
    sid    = "AllowAssumeDVSATifAccessRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/DVSATifAccess"
    ]
  }
}
