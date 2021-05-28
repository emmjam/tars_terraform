resource "aws_iam_group_membership" "readonly_platform" {
  count = length(var.readonly_platform_users) == 0 ? 0 : 1
  name  = aws_iam_group.readonly_platform.name
  group = aws_iam_group.readonly_platform.name

  users = var.readonly_platform_users

}
