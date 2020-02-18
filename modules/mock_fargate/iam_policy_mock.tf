data "aws_iam_policy" "main" {
  arn = var.iam_policy_arn
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = data.aws_iam_policy.main.arn
}

