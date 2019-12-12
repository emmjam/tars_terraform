resource "aws_iam_group_policy_attachment" "billing" {
  group      = aws_iam_group.billing.name
  policy_arn = aws_iam_policy.assume_billing_role.arn
}
