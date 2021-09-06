resource "aws_iam_role_policy_attachment" "readonly_ssmsession_access" {
  role       = aws_iam_role.readonly_ssm_session.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "readonly_ssmsession_support_access" {
  role       = aws_iam_role.readonly_ssm_session.name
  policy_arn = "arn:aws:iam::aws:policy/AWSSupportAccess"
}

resource "aws_iam_role_policy_attachment" "readonly_ssmsession" {
  role       = aws_iam_role.readonly_ssm_session.name
  policy_arn = aws_iam_policy.readonly_ssm_session.arn
}
