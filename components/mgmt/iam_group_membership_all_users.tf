resource "aws_iam_group_membership" "all_users" {
  count = "${length(var.all_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.all_users.name}"
  group = "${aws_iam_group.all_users.name}"

  users = [
    "${var.all_users}",
  ]
}
