resource "aws_iam_role_policy_attachment" "packer_systems_manager" {
  role       = aws_iam_role.packer.name
  policy_arn = aws_iam_policy.packer_systems_manager.arn
}

