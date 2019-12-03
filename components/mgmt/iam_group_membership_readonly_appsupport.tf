resource "aws_iam_group_membership" "readonly_appsupport" {
  count = "${length(var.readonly_appsupport_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.readonly_appsupport.name}"
  group = "${aws_iam_group.readonly_appsupport.name}"

  users = [
    "${var.readonly_appsupport_users}",
  ]
}