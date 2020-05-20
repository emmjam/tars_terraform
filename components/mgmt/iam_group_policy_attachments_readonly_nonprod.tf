resource "aws_iam_group_policy_attachment" "readonly_no_secrets_nonprod" {
  group      = aws_iam_group.readonly_no_secrets_nonprod.name
  policy_arn = aws_iam_policy.assume_readonly_no_secrets_role_nonprod.arn
}
