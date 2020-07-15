data "aws_iam_policy_document" "logging" {
  statement {
    sid    = "AllowLogging"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      aws_cloudwatch_log_group.main.arn,
    ]
  }
}

resource "aws_iam_policy" "logging" {
  name        = "${local.csi_name}-logging"
  description = "Logging policy for ${upper(var.name)} Lambda"
  policy      = data.aws_iam_policy_document.logging.json
}

resource "aws_iam_policy_attachment" "logging" {
  name       = "${local.csi_name}-logging"
  roles      = [aws_iam_role.main.name]
  policy_arn = aws_iam_policy.logging.arn
}
