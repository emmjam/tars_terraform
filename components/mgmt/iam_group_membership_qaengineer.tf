resource "aws_iam_group_membership" "qaengineer" {
  count = "${length(var.qaengineer_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.qaengineer.name}"
  group = "${aws_iam_group.qaengineer.name}"

  users = [
    "${var.qaengineer_users}",
  ]
}