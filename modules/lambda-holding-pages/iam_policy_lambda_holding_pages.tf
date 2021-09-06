resource "aws_iam_policy" "lambda_holding_pages" {
  name   = "${local.csi}-lambda-holding-pages"
  path   = "/"
  policy = data.aws_iam_policy_document.lambda_holding_pages.json

  depends_on = [
    aws_cloudwatch_log_group.lambda_holding_pages,
  ]
}
