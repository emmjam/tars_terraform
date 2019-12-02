resource "aws_iam_group_membership" "readonly_tssops" {
  count = "${length(var.readonly_tssops_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.readonly_tssops.name}"
  group = "${aws_iam_group.readonly_tssops.name}"

  users = [
    "${var.readonly_tssops_users}",
  ]
}