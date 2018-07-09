# TODO: this is just a temporary policy
data "aws_iam_policy_document" "capita_perf_ro_users" {
  statement {
    sid    = "AllowCapitaCloudWatch"
    effect = "Allow"
    actions = [
        "cloudwatch:GetDashboard",
        "cloudwatch:GetMetricData",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:ListDashboards",
        "cloudwatch:ListMetrics"
    ]
    resources = [
      "*",
    ]
  }
}
