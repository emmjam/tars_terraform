data "aws_iam_policy_document" "receive_sqs_message" {
  statement {
    sid    = "ReceiveMessage"
    effect = "Allow"

    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "receive_sqs_message" {
  name        = "${local.csi}-receive_sqs_message"
  description = "Receive Message from sqs Policy"
  policy      = data.aws_iam_policy_document.receive_sqs_message.json
}

resource "aws_iam_role_policy_attachment" "email_notify" {
  role       = module.lambda_notify.role_name
  policy_arn = aws_iam_policy.receive_sqs_message.arn
}

data "aws_iam_policy_document" "allow_ssm" {
  statement {
    sid    = "AllowSSM"
    effect = "Allow"

    actions = [
      "ssm:*"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "allow_ssm" {
  name        = "${local.csi}-allow-ssm"
  description = "Allow SSM Policy"
  policy      = data.aws_iam_policy_document.allow_ssm.json
}

resource "aws_iam_role_policy_attachment" "allow_ssm" {
  role       = module.lambda_notify.role_name
  policy_arn = aws_iam_policy.allow_ssm.arn
}
