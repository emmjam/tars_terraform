resource "aws_iam_group_policy_attachment" "readonly_tssops" {
  group      = aws_iam_group.readonly_tssops.name
  policy_arn = aws_iam_policy.assume_readonly_role_tssops.arn
}
