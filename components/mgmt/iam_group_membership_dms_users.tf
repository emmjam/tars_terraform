resource "aws_iam_group_membership" "dms_users" {
  count = "${length(var.administrators_tssops_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.dms_users.name}"
  group = "${aws_iam_group.dms_users.name}"

  users = [
    "${var.dms_users}",
  ]
}