resource "aws_iam_group_policy_attachment" "administrators_platform" {
  group      = aws_iam_group.administrators_platform.name
  policy_arn = aws_iam_policy.assume_administrators_role_platform.arn
}
