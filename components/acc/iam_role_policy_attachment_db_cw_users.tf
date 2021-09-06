resource "aws_iam_role_policy_attachment" "db_cw_users" {
  role       = aws_iam_role.db_cw_users.name
  policy_arn = aws_iam_policy.db_cw_users.arn
}