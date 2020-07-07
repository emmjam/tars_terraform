data "aws_iam_policy_document" "ibs_parameter_store" {
  statement {
    sid    = "AllowIBSGetParameter"
    effect = "Allow"

    actions = [
      "ssm:GetParameter",
    ]

    resources = [
      format(
        "arn:aws:ssm:%s:%s:parameter/%s/ibs/*",
        var.aws_region,
        var.aws_account_id,
        var.environment,
      )
    ]
  }
}
