resource "aws_iam_group_policy_attachment" "readonly_qaengineer" {
  group      = aws_iam_group.readonly_qaengineer.name
  policy_arn = aws_iam_policy.assume_readonly_role_qaengineer.arn
}

resource "aws_iam_group_policy_attachment" "readonly_no_secrets_qaengineer" {
  group      = aws_iam_group.readonly_qaengineer.name
  policy_arn = aws_iam_policy.assume_readonly_role_qaengineer.arn
}
