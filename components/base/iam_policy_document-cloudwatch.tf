resource "aws_iam_policy" "cloudwatch" {
    name        = "${var.project}-${var.environment}-${var.component}-cloudwatch"
    description = "IAM Policy for ${var.project}-${var.environment}-${var.component}-cloudwatch"
    policy     = "${data.aws_iam_policy_document.cloudwatchlogs.json}"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_jmeter" {
    role       = "${module.microservice_jmeter.iam_role_name}"
    policy_arn = "${aws_iam_policy.cloudwatch.arn}"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_squidnat" {
    role       = "${module.squidnat.iam_role_name}"
    policy_arn = "${aws_iam_policy.cloudwatch.arn}"
}


