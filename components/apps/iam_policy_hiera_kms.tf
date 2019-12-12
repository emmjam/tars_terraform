# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata-obs" {
  role       = module.obs.iam_role_name
  policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn
}

# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata-ibs" {
  role       = module.ibs.iam_role_name
  policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn
}

# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata-fyndi-f" {
  role       = module.fyndi-b.iam_role_name
  policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn
}

# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata-fyndi-b" {
  role       = module.fyndi-f.iam_role_name
  policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn
}

