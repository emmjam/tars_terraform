data "aws_iam_policy_document" "lambda_holding_pages" {
  statement {
    sid    = "holdingPagesEdgeLambdaLogs"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "logs:CreateLogStream",
    ]

    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }

}
