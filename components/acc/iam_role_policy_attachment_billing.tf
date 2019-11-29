resource "aws_iam_role_policy_attachment" "billing" {
  role       = "${aws_iam_role.billing.name}"
  policy_arn = "${aws_iam_policy.billing.arn}"
}