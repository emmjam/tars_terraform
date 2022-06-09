resource "aws_iam_role_policy_attachment" "aws_ssm_managed_instance" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
