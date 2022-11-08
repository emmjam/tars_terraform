resource "aws_iam_role_policy_attachment" "cpc_front_ssm_parameters" {
  role       = module.cpc-front.iam_role_name
  policy_arn = aws_iam_policy.cpc_ssm_parameters.arn
}

