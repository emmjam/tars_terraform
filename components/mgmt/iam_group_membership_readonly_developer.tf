resource "aws_iam_group_membership" "readonly_developer" {
  count = "${length(var.readonly_developer_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.readonly_developer.name}"
  group = "${aws_iam_group.readonly_developer.name}"

  users = [
    "${var.readonly_developer_users}",
  ]
}