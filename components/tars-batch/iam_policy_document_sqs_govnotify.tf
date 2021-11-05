data "aws_iam_policy_document" "send_sqs_message" {
  statement {
    sid    = "SendMessage"
    effect = "Allow"

    actions = [
      "sqs:SendMessage",
      "sqs:GetQueueAttributes",
      "sqs:SendMessageBatch",
      "sqs:ReceiveMessage",
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "send_sqs_message" {
  name        = "${local.csi}-send_sqs_message"
  description = "Send Message from sqs Policy"
  policy      = data.aws_iam_policy_document.send_sqs_message.json
}
