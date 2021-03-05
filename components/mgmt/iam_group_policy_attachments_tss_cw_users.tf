resource "aws_iam_group_policy_attachment" "tss_cw_users" {
  group      = aws_iam_group.tss_cw_users.name
  policy_arn = aws_iam_policy.assume_tss_cw_users_role.arn
}
