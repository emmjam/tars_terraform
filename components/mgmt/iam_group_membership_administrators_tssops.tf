resource "aws_iam_group_membership" "administrators_tssops" {
  count = "${length(var.administrators_tssops_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.administrators_tssops.name}"
  group = "${aws_iam_group.administrators_tssops.name}"

  users = [
    "${var.administrators_tssops_users}",
  ]
}