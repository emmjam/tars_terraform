resource "aws_iam_role_policy_attachment" "oraclexe" {
  count = var.account_environment != "mgmt" ? 1 : 0
  policy_arn = aws_iam_policy.oraclexe[count.index].arn

  role = aws_iam_role.oraclexe[count.index].name
}

