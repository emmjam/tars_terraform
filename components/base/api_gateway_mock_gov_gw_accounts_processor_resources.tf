resource "aws_api_gateway_resource" "mock_gov_gw_accounts" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  rest_api_id = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  parent_id   = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].root_resource_id
  path_part   = "accounts"
}

resource "aws_api_gateway_resource" "mock_gov_gw_accounts_processor" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  rest_api_id = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  parent_id   = aws_api_gateway_resource.mock_gov_gw_accounts[count.index].id
  path_part   = "processor"
}