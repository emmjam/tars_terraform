#Policy to allow guarduty to slack lambda to write to logs and metrics
data "aws_iam_policy_document" "guardduty_slack" {
  statement {
    sid    = "GuarddutyToSlackLogs"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.lambda_guardduty_slack.arn}",
    ]
  }

  statement {
    sid    = "AllowPutCloudWatchMetrics"
    effect = "Allow"

    actions = [
      "cloudwatch:PutMetricData",
    ]

    resources = [
      "*",
    ]
  }
}
