resource "aws_iam_role_policy_attachment" "packer_hieradata" {
  role       = aws_iam_role.packer.name
  policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn
}

