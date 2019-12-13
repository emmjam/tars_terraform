data "aws_iam_policy_document" "prometheus" {
  statement {
    sid    = "AllowPrometheusCloudwatchScrape"
    effect = "Allow"

    actions = [
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:ListMetrics",
      "ec2:DescribeInstances",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "prometheus" {
  name        = "${local.csi}-prometheus"
  description = "IAM policy for ${local.csi}-prometheus"
  policy      = data.aws_iam_policy_document.prometheus.json
}

