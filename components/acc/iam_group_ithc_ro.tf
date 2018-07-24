resource "aws_iam_group" "ithc_ro_users" {
  count = "${length(var.ithc_ro_users) == 0 ? 0 : 1}"
  name  = "ITHCROUsers"
  path  = "/"
}
