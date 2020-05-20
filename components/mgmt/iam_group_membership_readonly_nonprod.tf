resource "aws_iam_group_membership" "readonly_no_secrets_nonprod" {
  count = length(var.readonly_no_secrets_nonprod_users) == 0 ? 0 : 1
  name  = aws_iam_group.readonly_no_secrets_nonprod.name
  group = aws_iam_group.readonly_no_secrets_nonprod.name

  users = var.readonly_no_secrets_nonprod_users
}