resource "aws_iam_group_membership" "new_all_users" {
  count = "${length(var.new_all_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.new_all_users.name}"
  group = "${aws_iam_group.new_all_users.name}"

  users = [
    "${var.new_all_users}",
  ]
}
