resource "aws_iam_role_policy_attachment" "administrators_access" {
  role       = aws_iam_role.administrators.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}