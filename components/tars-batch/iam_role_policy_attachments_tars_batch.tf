resource "aws_iam_role_policy_attachment" "hieradata" {
  role       = module.tars_batch.iam_role_name
  policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn
}

resource "aws_iam_role_policy_attachment" "cloudwatch_tars_core" {
  role       = module.tars_batch.iam_role_name
  policy_arn = data.terraform_remote_state.base.outputs.iam_policy_cloudwatch_arn
}

resource "aws_iam_role_policy_attachment" "ssm_parameters_batch" {
  role       = module.tars_batch.iam_role_name
  policy_arn = aws_iam_policy.ssm_parameters.arn
}
