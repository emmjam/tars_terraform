resource "aws_iam_group_policy_attachment" "nonprod_readonly_ssm_access" {
  group      = aws_iam_group.nonprod_readonly_ssm_access.name
  policy_arn = aws_iam_policy.assume_nonprod_readonly_ssm_access.arn
}
