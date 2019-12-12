resource "aws_iam_group_membership" "readonly_dvsa" {
  count = length(var.readonly_dvsa_users) == 0 ? 0 : 1
  name  = aws_iam_group.readonly_dvsa.name
  group = aws_iam_group.readonly_dvsa.name

  users = var.readonly_dvsa_users
}
