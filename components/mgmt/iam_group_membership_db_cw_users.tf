resource "aws_iam_group_membership" "db_cw_users" {
  count = "${length(var.db_cw_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.db_cw_users.name}"
  group = "${aws_iam_group.db_cw_users.name}"

  users = [
    "${var.db_cw_users}",
  ]
}