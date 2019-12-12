resource "aws_iam_group_policy_attachment" "readonly_appsupport" {
  group      = aws_iam_group.readonly_appsupport.name
  policy_arn = aws_iam_policy.assume_readonly_role_appsupport.arn
}

resource "aws_iam_group_policy_attachment" "readonly_no_secrets_appsupport" {
  group      = aws_iam_group.readonly_appsupport.name
  policy_arn = aws_iam_policy.assume_readonly_role_appsupport.arn
}
