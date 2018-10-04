# TODO: peacheym: Give this a descriptive name identifying
#                 what activity this policy is intended to
#                 provide regardless of what it gets attached to
data "aws_iam_policy_document" "cloudwatchlogs" {
  statement {
    # TODO: peacheym: sid = "RealDescriptiveName"
    effect = "Allow"

    actions = [
      "cloudwatch:PutMetricData",
      "ec2:DescribeTags",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
    ]

    resources = [
      "*",
    ]
  }
}
