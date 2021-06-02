resource "aws_iam_role_policy_attachment" "oraclexe" {
  policy_arn = aws_iam_policy.oraclexe.arn

  role = aws_iam_role.oraclexe.name
}

