resource "aws_iam_group_policy_attachment" "readonly_developer" {
  group      = aws_iam_group.readonly_developer.name
  policy_arn = aws_iam_policy.assume_readonly_role_developer.arn
}

resource "aws_iam_group_policy_attachment" "readonly_no_secrets_developer" {
  group      = aws_iam_group.readonly_developer.name
  policy_arn = aws_iam_policy.assume_readonly_role_developer.arn
}
