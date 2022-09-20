resource "aws_api_gateway_method" "mock_gov_gw_accounts_processor" {
  count         = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  rest_api_id   = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  resource_id   = aws_api_gateway_resource.mock_gov_gw_accounts_processor[count.index].id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "mock_gov_gw_accounts_processor" {
  count                   = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  rest_api_id             = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  resource_id             = aws_api_gateway_resource.mock_gov_gw_accounts_processor[count.index].id
  http_method             = aws_api_gateway_method.mock_gov_gw_accounts_processor[count.index].http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${var.aws_account_id}:function:tars-${var.environment}-${var.component}-mock-gov-gw-accounts-processor/invocations"
  credentials             = aws_iam_role.mock_gov_gw_accounts_processor_api_execution_role[count.index].arn
  passthrough_behavior    = "NEVER"
}

resource "aws_api_gateway_method_response" "mock_gov_gw_accounts_processor" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  rest_api_id = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  resource_id = aws_api_gateway_resource.mock_gov_gw_accounts_processor[count.index].id
  http_method = aws_api_gateway_method.mock_gov_gw_accounts_processor[count.index].http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_method_response" "mock_gov_gw_accounts_processor_400" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  rest_api_id = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  resource_id = aws_api_gateway_resource.mock_gov_gw_accounts_processor[count.index].id
  http_method = aws_api_gateway_method.mock_gov_gw_accounts_processor[count.index].http_method
  status_code = "400"

  
  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_method_response" "mock_gov_gw_accounts_processor_500" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  rest_api_id = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  resource_id = aws_api_gateway_resource.mock_gov_gw_accounts_processor[count.index].id
  http_method = aws_api_gateway_method.mock_gov_gw_accounts_processor[count.index].http_method
  status_code = "500"

  
  response_models = {
    "application/json" = "Empty"
  }
}

