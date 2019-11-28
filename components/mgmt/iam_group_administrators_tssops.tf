resource "aws_iam_group" "administrators_tssops" {
  count = "${length(var.administrators_tssops_users) == 0 ? 0 : 1}"
  name = "AdministratorsTSSOps"
  path = "/"
}
