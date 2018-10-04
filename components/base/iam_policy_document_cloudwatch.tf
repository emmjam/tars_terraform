resource "aws_iam_policy" "cloudwatch" {
  name        = "${local.csi}-cloudwatch"
  description = "IAM Policy for ${local.csi}-cloudwatch"
  policy      = "${data.aws_iam_policy_document.cloudwatchlogs.json}"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_jmeter" {
  role       = "${module.microservice_jmeter.iam_role_name}"
  policy_arn = "${aws_iam_policy.cloudwatch.arn}"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_squidnat" {
  role       = "${module.squidnat.iam_role_name}"
  policy_arn = "${aws_iam_policy.cloudwatch.arn}"
}


