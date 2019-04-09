data "aws_iam_policy_document" "cw_ro_users" {
  statement {
    sid    = "AllowRDSDescribe"
    effect = "Allow"

    actions = [
      "rds:Describe*",
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