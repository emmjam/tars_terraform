data "aws_iam_policy_document" "amazonmq_cwl" {
  statement {
    sid    = "AllowAmazonMQCloudwatchLogs"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    principals {
      type = "Service"

      identifiers = [
        "mq.amazonaws.com",
      ]
    }

    resources = [
      "arn:aws:logs:*:*:log-group:/aws/amazonmq/broker/${aws_mq_broker.tars-awsmq.id}/*"
    ]
  }
}

resource "aws_cloudwatch_log_resource_policy" "amazonmq_cwl" {
  policy_name        = "${local.csi}-amazonmq-cwl"
  policy_document    = "${data.aws_iam_policy_document.amazonmq_cwl.json}"
}