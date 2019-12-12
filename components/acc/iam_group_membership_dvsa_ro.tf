resource "aws_iam_group_membership" "dvsa_ro_users" {
  count = length(var.dvsa_ro_users) == 0 ? 0 : 1
  name  = aws_iam_group.dvsa_ro_users.name
  group = aws_iam_group.dvsa_ro_users.name

  users = var.dvsa_ro_users
}

