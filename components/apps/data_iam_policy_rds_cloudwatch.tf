data "aws_iam_policy_document" "aurora_rds_cloudwatch_logs" {
  statement {
    sid    = "AllowPutCloudwatchLogsAurora"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:DescribeLogStreams",
      "logs:GetLogEvents",
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:*:*:log-group:/aws/rds/*:log-stream:*",
    ]
  }

  statement {
    sid    = "AllowCreateLogGroup"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:PutRetentionPolicy",
    ]

    resources = [
      "arn:aws:logs:*:*:log-group:/aws/rds/*",
    ]
  }
}
data "aws_iam_policy_document" "rds_assumerole" {
  statement {
    sid    = "AllowRDSAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "rds.amazonaws.com",
      ]
    }
  }
}
