# TODO: adjust permissions based on real usage
data "aws_iam_policy_document" "messagingnode" {
  statement {
    sid    = "AllowCW"
    effect = "Allow"

    actions = [
      "cloudwatch:PutMetricData",
      "ec2:DescribeTags",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:DescribeLogGroups",
      "logs:CreateLogStream",
      "logs:CreateLogGroup"
    ]

    resources = [
      "*",
    ]
  }
  statement {
    sid    = "AllowCW2"
    effect = "Allow"

    actions = [
      "ssm:GetParameter"
    ]

    resources = [
      "arn:aws:ssm:*:*:parameter/AmazonCloudWatch-*",
    ]
  }
  statement {
    sid    = "AllowADLookup"
    effect = "Allow"

    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters"
    ]

    resources = [
      "arn:aws:ssm:*:*:parameter/AD-*",
    ]
  }
}

resource "aws_iam_policy" "messagingnode" {
  name        = "${var.project}-${var.environment}-${var.component}-messagingnode"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-messagingnode"
  policy      = "${data.aws_iam_policy_document.messagingnode.json}"
}
