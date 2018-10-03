resource "aws_iam_group_membership" "ithc_ro_users" {
  count = "${length(var.ithc_ro_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.ithc_ro_users.name}"
  group = "${aws_iam_group.ithc_ro_users.name}"

  users = [
    "${var.ithc_ro_users}",
  ]
}
