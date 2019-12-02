resource "aws_iam_group" "readonly_developer" {
  count = "${length(var.readonly_developer_users) == 0 ? 0 : 1}"
  name = "ReadOnlyDeveloper"
  path = "/"
}
