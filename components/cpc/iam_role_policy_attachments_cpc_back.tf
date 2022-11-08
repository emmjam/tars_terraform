resource "aws_iam_role_policy_attachment" "cpc_back_ssm_parameters" {
  role       = module.cpc-back.iam_role_name
  policy_arn = aws_iam_policy.cpc_ssm_parameters.arn
}

