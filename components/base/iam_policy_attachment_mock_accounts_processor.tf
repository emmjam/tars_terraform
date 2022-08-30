
resource "aws_iam_role_policy_attachment" "lambda_mock_gov_gw_accounts_processor" {
  count      = var.mock_gov_gw_accounts_processor == true ? 1 : 0
  
  policy_arn = aws_iam_policy.lambda_mock_gov_gw_accounts_processor[count.index].arn

  role       = module.lambda_mock_gov_gw_accounts_processor[count.index].role_name
}


