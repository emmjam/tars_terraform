data "aws_iam_policy" "epdq" {
  arn = var.epdq_iam_policy_arn
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = data.aws_iam_policy.epdq.arn
}

