resource "aws_iam_group_policy_attachment" "db_cw_users" {
  count      = "${length(var.db_cw_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.db_cw_users.name}"
  policy_arn = "${aws_iam_policy.assume_db_cw_users_role.arn}"
}
