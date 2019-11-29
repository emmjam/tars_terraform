resource "aws_iam_group" "qaengineer" {
  count = "${length(var.qaengineer_users) == 0 ? 0 : 1}"
  name = "QAEngineer"
  path = "/"
}
