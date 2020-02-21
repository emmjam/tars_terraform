data "aws_iam_policy_document" "lambda_assumerole" {
  statement {
    sid    = "AllowLambdaAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
  }
}
