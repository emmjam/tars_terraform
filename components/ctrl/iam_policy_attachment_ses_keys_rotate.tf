resource "aws_iam_role_policy_attachment" "ses_keys_rotate" {
  count      = var.account_environment != "mgmt" ? 1 : 0
  policy_arn = aws_iam_policy.ses_keys_rotate[count.index].arn
  role       = aws_iam_role.ses_keys_rotate.name
}