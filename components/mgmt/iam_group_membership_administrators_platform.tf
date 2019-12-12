resource "aws_iam_group_membership" "administrators_platform" {
  count = length(var.administrators_platform_users) == 0 ? 0 : 1
  name  = aws_iam_group.administrators_platform.name
  group = aws_iam_group.administrators_platform.name

  users = var.administrators_platform_users
}
