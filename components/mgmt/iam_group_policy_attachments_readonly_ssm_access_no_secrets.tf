resource "aws_iam_group_policy_attachment" "readonly_ssm_access_no_secrets" {
  group      = aws_iam_group.readonly_ssm_access_no_secrets.name
  policy_arn = aws_iam_policy.assume_readonly_ssm_access_no_secrets.arn
}
