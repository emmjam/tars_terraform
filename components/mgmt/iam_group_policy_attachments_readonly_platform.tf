resource "aws_iam_group_policy_attachment" "readonly_platform" {
  group      = aws_iam_group.readonly_platform.name
  policy_arn = aws_iam_policy.assume_readonly_role_platform.arn
}
