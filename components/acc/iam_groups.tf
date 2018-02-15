resource "aws_iam_group" "all_users" {
  name = "AllUsers"
  path = "/"
}

resource "aws_iam_group" "administrators" {
  name = "Administrators"
  path = "/"
}

resource "aws_iam_group" "power_users" {
  count = "${length(var.power_users) == 0 ? 0 : 1}"
  name  = "PowerUsers"
  path  = "/"
}
