resource "aws_api_gateway_method" "environment_name_version_current_get" {
  rest_api_id   = aws_api_gateway_rest_api.release_data.id
  resource_id   = aws_api_gateway_resource.environment_name_version_current.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "environment_name_version_current_get" {
  rest_api_id             = aws_api_gateway_rest_api.release_data.id
  resource_id             = aws_api_gateway_resource.environment_name_version_current.id
  http_method             = aws_api_gateway_method.environment_name_version_current_get.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:dynamodb:action/Query"
  credentials             = aws_iam_role.release_data_api_execution_role.arn
  passthrough_behavior    = "NEVER"
  request_templates = {
    "application/json" = file("${path.module}/files/environment_name_current_get_integration.json")
  }
}

resource "aws_api_gateway_integration_response" "environment_name_version_current_get" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  resource_id = aws_api_gateway_resource.environment_name_version_current.id
  http_method = aws_api_gateway_method.environment_name_version_current_get.http_method
  status_code = aws_api_gateway_method_response.environment_name_version_current_get.status_code

  response_templates = {
    "application/json" = file("${path.module}/files/environment_name_current_get_integration_response.json")
  }
}

resource "aws_api_gateway_method_response" "environment_name_version_current_get" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  resource_id = aws_api_gateway_resource.environment_name_version_current.id
  http_method = aws_api_gateway_method.environment_name_version_current_get.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

