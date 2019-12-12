resource "aws_iam_group_policy_attachment" "all_users_enforce_mfa" {
  group      = aws_iam_group.all_users.name
  policy_arn = aws_iam_policy.enforce_mfa.arn
}

resource "aws_iam_group_policy_attachment" "administrator_full_access" {
  group      = aws_iam_group.administrators.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "power_users" {
  group      = aws_iam_group.power_users.name
  policy_arn = aws_iam_policy.power_users.arn
}

# Attach the AssumeRole Ops IAM Policy to the "ops" AWS IAM Group
resource "aws_iam_group_policy_attachment" "ops_assumerole_ops" {
  group      = aws_iam_group.ops.name
  policy_arn = aws_iam_policy.assumerole_ops.arn
}

