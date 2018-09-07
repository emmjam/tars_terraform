data "aws_iam_policy_document" "logging" {
  statement {
    sid    = "AllowLogging"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.main.arn}",
    ]
  }
}

resource "aws_iam_policy" "logging" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "logging"
  )}"

  description = "Logging policy for ${var.name} Lambda"
  policy      = "${data.aws_iam_policy_document.logging.json}"
}

resource "aws_iam_role_policy_attachment" "logging" {
  role       = "${aws_iam_role.main.name}"
  policy_arn = "${aws_iam_policy.logging.arn}"
}
