resource "aws_iam_group_policy_attachment" "administrators_platform_nonprod" {
  group      = aws_iam_group.administrators_platform_nonprod.name
  policy_arn = aws_iam_policy.assume_administrators_role_platform_nonprod.arn
}
