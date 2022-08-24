/*
resource "aws_api_gateway_rest_api" "release_data" {
  name = "${local.csi}-release-data"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = merge(
    var.default_tags,
    {
      "Name" : "${local.csi}-release-data"
    }
  )
}

resource "aws_api_gateway_deployment" "release_data" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id

  # Triggers a deployment when any of these resources change
  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.environment,
      aws_api_gateway_resource.environment_name,
      aws_api_gateway_resource.environment_name_version,
      aws_api_gateway_resource.environment_name_version_current,
      aws_api_gateway_method.environment_name_version_current_get,
      aws_api_gateway_integration.environment_name_version_current_get,
      aws_api_gateway_integration_response.environment_name_version_current_get,
      aws_api_gateway_method_response.environment_name_version_current_get,
      aws_api_gateway_resource.version,
      aws_api_gateway_resource.version_latest,
      aws_api_gateway_method.version_latest_get,
      aws_api_gateway_integration.version_latest_get,
      aws_api_gateway_integration_response.version_latest_get,
      aws_api_gateway_method_response.version_latest_get,
      data.aws_iam_policy_document.release_data_api_resource_policy,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "mgmt" {
  rest_api_id   = aws_api_gateway_rest_api.release_data.id
  deployment_id = aws_api_gateway_deployment.release_data.id
  stage_name    = "mgmt"

  cache_cluster_size = "0.5"

  tags = merge(
    var.default_tags,
    {
      "Name" : "${local.csi}-release-data"
    }
  )
}
*/
