resource "aws_iam_group_policy_attachment" "billing" {
  count      = "${length(var.billing_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.billing.name}"
  policy_arn = "${aws_iam_policy.assume_billing_role.arn}"
}
