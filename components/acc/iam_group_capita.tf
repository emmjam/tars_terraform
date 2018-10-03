resource "aws_iam_group" "capita_users" {
  count = "${length(var.capita_users) == 0 ? 0 : 1}"
  name  = "CapitaUsers"
  path  = "/"
}
