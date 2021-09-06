resource "aws_iam_role_policy_attachment" "jenkins_admin_access" {
  role       = aws_iam_role.jenkins_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
