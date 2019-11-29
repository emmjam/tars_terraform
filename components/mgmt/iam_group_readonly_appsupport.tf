resource "aws_iam_group" "readonly_appsupport" {
  count = "${length(var.readonly_appsupport_users) == 0 ? 0 : 1}"
  name = "ReadOnlyAppSupport"
  path = "/"
}
