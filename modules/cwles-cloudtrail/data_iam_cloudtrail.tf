data "aws_iam_policy_document" "cloudtrail_assumerole" {
  statement {
    sid    = "CloudTrailAssumeRole"
    effect = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "cloudtrail.amazonaws.com",
      ]
    }

    actions = [
      "sts:AssumeRole",
    ]
  }
}

data "aws_iam_policy_document" "cloudtrail_put_cloudwatchlogs" {
  statement {
    sid    = "AllowCloudTrailCreateAndWriteLogStream"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.cloudtrail.arn}",
    ]
  }
}
