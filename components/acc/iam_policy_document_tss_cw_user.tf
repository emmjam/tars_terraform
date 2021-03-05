data "aws_iam_policy_document" "tss_cw_users" {
  statement {
    sid    = "AllowCWDescribe"
    effect = "Allow"

    actions = [
      "cloudwatch:Describe*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowCW"
    effect = "Allow"

    actions = [
        "cloudwatch:GetDashboard",
        "cloudwatch:GetMetricData",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:ListDashboards",
        "cloudwatch:ListMetrics",
    ]

    resources = [
      "*",
    ]
  }
}
