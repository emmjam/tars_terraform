resource "aws_iam_group_policy_attachment" "dms_users" {
  count      = "${length(var.dms_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.dms_users.name}"
  policy_arn = "${aws_iam_policy.assume_dms_users_role.arn}"
}
