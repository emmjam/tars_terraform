resource "aws_lambda_function" "guardduty_slack" {
  function_name = "${local.csi}-${var.name}"

  description = "${var.name} Lambda function"

  s3_bucket = "${var.lambda_platform_bucket}"
  s3_key    = "${var.lambda_guardduty_slack_s3_key}"

  runtime     = "${var.runtime}"
  handler     = "${var.handler}"
  memory_size = "${var.memory_size}"

  role = "${aws_iam_role.lambda_guardduty_slack.arn}"

  environment {
    variables = {
      ENCRYPTED_HOOK_URL = "${var.encrypted_webhook_url}"
    }
  }

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/${var.name}",
    )
  )}"
}
