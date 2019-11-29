resource "aws_iam_group" "readonly_qaengineer" {
  count = "${length(var.readonly_qaengineer_users) == 0 ? 0 : 1}"
  name = "ReadOnlyQAEngineer"
  path = "/"
}
