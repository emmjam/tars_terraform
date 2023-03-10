resource "aws_iam_group_membership" "administrators_tssops" {
  name  = aws_iam_group.administrators_tssops.name
  group = aws_iam_group.administrators_tssops.name

  users = var.administrators_tssops_users
}
