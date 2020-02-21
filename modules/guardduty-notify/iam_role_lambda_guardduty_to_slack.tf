resource "aws_iam_role" "lambda_guardduty_slack" {
  name               = "${local.csi}-lambda-guardduty-slack"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_assumerole.json}"

  tags = "${merge(
   local.default_tags,
    map(
      "Name", "${local.csi}/${var.module}",
    ),
  )}"
}

resource "aws_iam_role_policy_attachment" "guardduty_slack_policy" {
  role       = "${aws_iam_role.lambda_guardduty_slack.name}"
  policy_arn = "${aws_iam_policy.lambda_guardduty_slack.arn}"
}

resource "aws_iam_role_policy_attachment" "guardduty_slack_kms" {
  role       = "${aws_iam_role.lambda_guardduty_slack.name}"
  policy_arn = "${var.platform_ops_kms_user_policy_arn}"
}
