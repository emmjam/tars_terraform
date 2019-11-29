resource "aws_iam_group" "administrators_platform" {
  count = "${length(var.administrators_platform_users) == 0 ? 0 : 1}"
  name = "AdministratorsPlatform"
  path = "/"
}
