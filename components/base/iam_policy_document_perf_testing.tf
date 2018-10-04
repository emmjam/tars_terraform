resource "aws_iam_policy" "perf-testing-upload" {
  name        = "${local.csi}-perf-testing-upload"
  description = "IAM Policy for ${local.csi}-perf-testing-upload"
  policy      = "${data.aws_iam_policy_document.perf-testing-upload.json}"
}

resource "aws_iam_role_policy_attachment" "perf-testing-upload" {
  role       = "${module.microservice_jmeter.iam_role_name}"
  policy_arn = "${aws_iam_policy.perf-testing-upload.arn}"
}
