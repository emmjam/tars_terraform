resource "aws_iam_group_policy_attachment" "dvsa_ro_users" {
  group      = aws_iam_group.dvsa_ro_users.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "dvsa_ro_users_enforce_mfa" {
  group      = aws_iam_group.dvsa_ro_users.name
  policy_arn = aws_iam_policy.enforce_mfa.arn
}

