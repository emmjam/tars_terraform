resource "aws_iam_role_policy_attachment" "bobj" {
  role       = module.bobj.iam_role_name
  policy_arn = data.terraform_remote_state.base.outputs.iam_policy_bobjnode_arn
}

# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "bobj_hieradata" {
  role       = module.bobj.iam_role_name
  policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn
}

