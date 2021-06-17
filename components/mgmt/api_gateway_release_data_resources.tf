resource "aws_api_gateway_resource" "environment" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  parent_id   = aws_api_gateway_rest_api.release_data.root_resource_id
  path_part   = "environment"
}

resource "aws_api_gateway_resource" "environment_name" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  parent_id   = aws_api_gateway_resource.environment.id
  path_part   = "{name}"
}

resource "aws_api_gateway_resource" "environment_name_version" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  parent_id   = aws_api_gateway_resource.environment_name.id
  path_part   = "version"
}

resource "aws_api_gateway_resource" "environment_name_version_current" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  parent_id   = aws_api_gateway_resource.environment_name_version.id
  path_part   = "current"
}

resource "aws_api_gateway_resource" "version" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  parent_id   = aws_api_gateway_rest_api.release_data.root_resource_id
  path_part   = "version"
}

resource "aws_api_gateway_resource" "version_latest" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  parent_id   = aws_api_gateway_resource.version.id
  path_part   = "latest"
}

