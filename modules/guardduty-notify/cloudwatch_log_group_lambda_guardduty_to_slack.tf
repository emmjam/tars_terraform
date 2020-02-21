# The Cloudwatch Logs Group for logging output from the GuardDuty to slack Lambda function
resource "aws_cloudwatch_log_group" "lambda_guardduty_slack" {
  name              = "/aws/lambda/${aws_lambda_function.guardduty_slack.function_name}"
  retention_in_days = "${var.cwlg_retention_in_days}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/${var.name}",
      "Module", var.module,
    )
  )}"
}
