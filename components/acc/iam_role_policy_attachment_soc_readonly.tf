resource "aws_iam_role_policy_attachment" "soc_readonly" {
  role       = "soc-organization-read-only"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}