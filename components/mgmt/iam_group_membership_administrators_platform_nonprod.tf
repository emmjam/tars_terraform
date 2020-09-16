resource "aws_iam_group_membership" "administrators_platform_nonprod" {
  count = length(var.administrators_platform_nonprod_users) == 0 ? 0 : 1
  name  = aws_iam_group.administrators_platform_nonprod.name
  group = aws_iam_group.administrators_platform_nonprod.name

  users = var.administrators_platform_nonprod_users
}
