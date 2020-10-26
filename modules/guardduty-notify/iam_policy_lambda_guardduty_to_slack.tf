resource "aws_iam_policy" "lambda_guardduty_slack" {
  name   = "${local.csi}-lambda-guardduty-slack"
  path   = "/"
  policy = "${data.aws_iam_policy_document.guardduty_slack.json}"

  depends_on = [
    aws_cloudwatch_log_group.lambda_guardduty_slack,
  ]
}
