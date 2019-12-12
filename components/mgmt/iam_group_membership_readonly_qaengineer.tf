resource "aws_iam_group_membership" "readonly_qaengineer" {
  count = length(var.readonly_qaengineer_users) == 0 ? 0 : 1
  name  = aws_iam_group.readonly_qaengineer.name
  group = aws_iam_group.readonly_qaengineer.name

  users = var.readonly_qaengineer_users
}
