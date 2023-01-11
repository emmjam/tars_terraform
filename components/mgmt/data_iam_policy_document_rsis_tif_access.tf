data "aws_iam_policy_document" "assume_rsis_tif_access_role" {
  count = var.account_environment == "live" ? 1 : 0

  statement {
    sid    = "AllowAssumeDVSATifAccessRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::246976497890:role/DVSATifAccess"
    ]
  }
}
