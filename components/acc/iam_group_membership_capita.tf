resource "aws_iam_group_membership" "capita_users" {
  count = "${length(var.capita_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.capita_users.name}"
  group = "${aws_iam_group.capita_users.name}"

  users = [
    "${var.capita_users}",
  ]
}
