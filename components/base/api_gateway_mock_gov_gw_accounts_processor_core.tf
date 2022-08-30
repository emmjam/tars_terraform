resource "aws_api_gateway_rest_api" "mock_gov_gw_accounts_processor" {
  count = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  name  = "${local.csi}-mock-gov-gw-accounts-processor"

  endpoint_configuration {
    types = ["PRIVATE"]
    vpc_endpoint_ids = [ "${data.terraform_remote_state.ctrl.outputs.vpc_endpoint_api_execute_id}"]
  }

  tags = merge(
    var.default_tags,
    {
      "Name" : "${local.csi}-mock-gov-gateway-accounts-processor"
    }
  )
}

resource "aws_api_gateway_deployment" "mock_gov_gw_accounts_processor" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id

  # Triggers a deployment when any of these resources change
  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.mock_gov_gw_accounts[count.index],
      aws_api_gateway_resource.mock_gov_gw_accounts_processor[count.index],
      aws_api_gateway_method.mock_gov_gw_accounts_processor[count.index],
      aws_api_gateway_resource.mock_gov_gw_accounts_processor[count.index],
      aws_api_gateway_method_response.mock_gov_gw_accounts_processor[count.index],
      aws_api_gateway_integration.mock_gov_gw_accounts_processor[count.index],
      data.aws_iam_policy_document.mock_gov_gw_accounts_processor_resource_policy[count.index],
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "mock_gov_gw_accounts_processor" {
  count         = var.mock_gov_gw_accounts_processor == true ? 1 : 0
  rest_api_id   = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  deployment_id = aws_api_gateway_deployment.mock_gov_gw_accounts_processor[count.index].id
  stage_name    = "mock-gov-gw"

  cache_cluster_size = "0.5"

  tags = merge(
    var.default_tags,
    {
      "Name" : "${local.csi}-mock-gov-gw-accounts-processor"
    }
  )
}
