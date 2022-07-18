data "aws_iam_policy_document" "envis_query_dynamodb" {
  statement {
    sid    = "AllowLambdaDynamoDBQuery"
    effect = "Allow"

    actions = [
      "dynamodb:Query",
    ]

    resources = [
      "arn:aws:dynamodb:${var.aws_region}:${var.aws_account_id}:table/${local.csi}-release_data/index/release_history",
      "arn:aws:dynamodb:${var.aws_region}:${var.aws_account_id}:table/${local.csi}-release_data"
    ]
  }
}
