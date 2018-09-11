data "aws_iam_policy_document" "prometheus" {
  statement {
    sid    = "AllowPrometheusCloudwatchScrape"
    effect = "Allow"

    actions = [
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:ListMetrics",
      "ec2:DescribeInstances"
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "prometheus" {
  name        = "${var.project}-${var.environment}-${var.component}-prometheus"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-prometheus"
  policy      = "${data.aws_iam_policy_document.prometheus.json}"
}