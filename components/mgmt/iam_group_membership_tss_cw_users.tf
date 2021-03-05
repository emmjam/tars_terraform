resource "aws_iam_group_membership" "tss_cw_users" {
  count = length(var.tss_cw_users) == 0 ? 0 : 1
  name  = aws_iam_group.tss_cw_users.name
  group = aws_iam_group.tss_cw_users.name

  users = var.tss_cw_users
}
