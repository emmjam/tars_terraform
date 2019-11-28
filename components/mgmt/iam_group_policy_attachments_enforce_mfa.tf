resource "aws_iam_group_policy_attachment" "all_users_enforce_mfa" {
  count      = "${length(var.new_all_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.new_all_users.name}"
  policy_arn = "${aws_iam_policy.enforce_mfa.arn}"
}
