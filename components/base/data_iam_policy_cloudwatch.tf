data "aws_iam_policy_document" "cloudwatchlogs" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "cloudwatch:PutMetricData",
      "ec2:DescribeTags",
    ]
    effect = "Allow"
    resources = [
      "*",
    ]
  }

}

