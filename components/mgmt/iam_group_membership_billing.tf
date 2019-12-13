resource "aws_iam_group_membership" "billing" {
  count = length(var.billing_users) == 0 ? 0 : 1
  name  = aws_iam_group.billing.name
  group = aws_iam_group.billing.name

  users = var.billing_users
}
