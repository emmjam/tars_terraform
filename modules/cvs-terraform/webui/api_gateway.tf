resource "aws_api_gateway_rest_api" "atf_account_view" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "atf-account-view"
  )}"

  binary_media_types = ["*/*"]

  description = "API Gateway for ${upper(var.project)} WebUI ${upper(var.environment)} environment"
}

## ROOT
resource "aws_api_gateway_method" "root_any" {
  rest_api_id      = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id      = "${aws_api_gateway_rest_api.atf_account_view.root_resource_id}"
  http_method      = "ANY"
  authorization    = "NONE"
  api_key_required = false

  request_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration" "root_any" {
  rest_api_id             = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id             = "${aws_api_gateway_rest_api.atf_account_view.root_resource_id}"
  http_method             = "${aws_api_gateway_method.root_any.http_method}"
  type                    = "AWS_PROXY"
  uri                     = "${module.lambda_atf_account_view.invoke_arn}"
  integration_http_method = "POST"
}

resource "aws_api_gateway_method_response" "root_any_200" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id = "${aws_api_gateway_rest_api.atf_account_view.root_resource_id}"
  http_method = "${aws_api_gateway_method.root_any.http_method}"
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "root_any_200" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id = "${aws_api_gateway_rest_api.atf_account_view.root_resource_id}"
  http_method = "${aws_api_gateway_method.root_any.http_method}"
  status_code = "${aws_api_gateway_method_response.root_any_200.status_code}"
  depends_on  = ["aws_api_gateway_integration.root_any"]
}

## PROXY
resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  parent_id   = "${aws_api_gateway_rest_api.atf_account_view.root_resource_id}"
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy_any" {
  rest_api_id      = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id      = "${aws_api_gateway_resource.proxy.id}"
  http_method      = "ANY"
  authorization    = "NONE"
  api_key_required = false

  request_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration" "proxy_any" {
  rest_api_id             = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id             = "${aws_api_gateway_resource.proxy.id}"
  http_method             = "${aws_api_gateway_method.proxy_any.http_method}"
  type                    = "AWS_PROXY"
  uri                     = "${module.lambda_atf_account_view.invoke_arn}"
  integration_http_method = "POST"
}

resource "aws_api_gateway_method_response" "proxy_any_200" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id = "${aws_api_gateway_resource.proxy.id}"
  http_method = "${aws_api_gateway_method.proxy_any.http_method}"
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "proxy_any_200" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id = "${aws_api_gateway_resource.proxy.id}"
  http_method = "${aws_api_gateway_method.proxy_any.http_method}"
  status_code = "${aws_api_gateway_method_response.proxy_any_200.status_code}"
  depends_on  = ["aws_api_gateway_integration.proxy_any"]
}

## ASSETS
resource "aws_api_gateway_resource" "assets" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  parent_id   = "${aws_api_gateway_rest_api.atf_account_view.root_resource_id}"
  path_part   = "assets"
}

resource "aws_api_gateway_resource" "assets_item" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  parent_id   = "${aws_api_gateway_resource.assets.id}"
  path_part   = "{item+}"
}

resource "aws_api_gateway_method" "assets_item_get" {
  rest_api_id   = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id   = "${aws_api_gateway_resource.assets_item.id}"
  http_method   = "GET"
  authorization = "NONE"

  request_parameters = {
    "method.request.path.item" = true
  }
}

resource "aws_api_gateway_integration" "assets_item_get" {
  rest_api_id             = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id             = "${aws_api_gateway_resource.assets_item.id}"
  http_method             = "${aws_api_gateway_method.assets_item_get.http_method}"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/${aws_s3_bucket.main.bucket}/assets/{object}"
  integration_http_method = "${aws_api_gateway_method.assets_item_get.http_method}"

  credentials = "${aws_iam_role.api_gateway.arn}"

  request_parameters = {
    "integration.request.path.object" = "method.request.path.item"
  }

  depends_on = ["aws_api_gateway_method.assets_item_get"]
}

resource "aws_api_gateway_method_response" "assets_item_get_200" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id = "${aws_api_gateway_resource.assets_item.id}"
  http_method = "${aws_api_gateway_method.assets_item_get.http_method}"
  status_code = "200"

  response_parameters = {
    "method.response.header.Date"           = true
    "method.response.header.ETag"           = true
    "method.response.header.Content-Length" = true
    "method.response.header.Content-Type"   = true
    "method.response.header.Last-Modified"  = true
    "method.response.header.Cache-Control"  = true
  }

  depends_on = ["aws_api_gateway_integration.assets_item_get"]
}

resource "aws_api_gateway_integration_response" "assets_item_get_200" {
  rest_api_id       = "${aws_api_gateway_rest_api.atf_account_view.id}"
  resource_id       = "${aws_api_gateway_resource.assets_item.id}"
  http_method       = "${aws_api_gateway_method.assets_item_get.http_method}"
  status_code       = "${aws_api_gateway_method_response.assets_item_get_200.status_code}"
  selection_pattern = "200"

  response_parameters = {
    "method.response.header.Content-Length" = "integration.response.header.Content-Length"
    "method.response.header.Content-Type"   = "integration.response.header.Content-Type"
    "method.response.header.Date"           = "integration.response.header.Date"
    "method.response.header.ETag"           = "integration.response.header.ETag"
    "method.response.header.Last-Modified"  = "integration.response.header.Last-Modified"
    "method.response.header.Cache-Control"  = "integration.response.header.Cache-Control"
  }

  content_handling = "CONVERT_TO_BINARY"
  depends_on       = ["aws_api_gateway_integration.assets_item_get"]
}

## DEPLOYMENT
resource "aws_api_gateway_deployment" "atf_account_view" {
  rest_api_id = "${aws_api_gateway_rest_api.atf_account_view.id}"
  stage_name  = "${var.environment}"

  # stage_description = "Deployed at: ${timestamp()}"


  # variables = {
  #   "DEPLOYED_AT" = "${timestamp()}"
  # }

  depends_on = [
    "aws_api_gateway_method.root_any",
    "aws_api_gateway_integration.root_any",
    "aws_api_gateway_method_response.root_any_200",
    "aws_api_gateway_integration_response.root_any_200",
    "aws_api_gateway_method.proxy_any",
    "aws_api_gateway_integration.proxy_any",
    "aws_api_gateway_method_response.proxy_any_200",
    "aws_api_gateway_integration_response.proxy_any_200",
    "aws_api_gateway_method.assets_item_get",
    "aws_api_gateway_integration.assets_item_get",
    "aws_api_gateway_method_response.assets_item_get_200",
    "aws_api_gateway_integration_response.assets_item_get_200",
  ]
}

## DOMAIN NAME
resource "aws_api_gateway_domain_name" "atf_account_view" {
  count = "${var.public_domain_name != "" ? 1 : 0 }"

  domain_name = "${var.api_gateway_dns_alias != "" ? 
    "${var.api_gateway_dns_alias}.${var.public_domain_name}" : "${var.component}-${var.environment}.${var.public_domain_name}"}"

  certificate_arn = "${data.aws_acm_certificate.main.arn}"
}

resource "aws_api_gateway_base_path_mapping" "atf_account_view" {
  count       = "${var.public_domain_name != "" ? 1 : 0 }"
  api_id      = "${aws_api_gateway_rest_api.atf_account_view.id}"
  stage_name  = "${aws_api_gateway_deployment.atf_account_view.stage_name}"
  domain_name = "${aws_api_gateway_domain_name.atf_account_view.domain_name}"
}
