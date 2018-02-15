resource "aws_api_gateway_rest_api" "main" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "api"
  )}"

  description = "API Gateway for ${upper(var.project)} ${upper(var.component)} ${upper(var.environment)} environment"
}

## PROXY
resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  parent_id   = "${aws_api_gateway_rest_api.main.root_resource_id}"
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy_any" {
  rest_api_id      = "${aws_api_gateway_rest_api.main.id}"
  resource_id      = "${aws_api_gateway_resource.proxy.id}"
  http_method      = "ANY"
  authorization    = "COGNITO_USER_POOLS"
  authorizer_id    = "${var.authorizer_id}"
  api_key_required = false

  request_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration" "proxy_any" {
  rest_api_id             = "${aws_api_gateway_rest_api.main.id}"
  resource_id             = "${aws_api_gateway_resource.proxy.id}"
  http_method             = "${aws_api_gateway_method.proxy_any.http_method}"
  type                    = "AWS_PROXY"
  uri                     = "${module.lambda_vts.invoke_arn}"
  integration_http_method = "POST"
}

resource "aws_api_gateway_method_response" "proxy_any_200" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  resource_id = "${aws_api_gateway_resource.proxy.id}"
  http_method = "${aws_api_gateway_method.proxy_any.http_method}"
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "proxy_any_200" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  resource_id = "${aws_api_gateway_resource.proxy.id}"
  http_method = "${aws_api_gateway_method.proxy_any.http_method}"
  status_code = "${aws_api_gateway_method_response.proxy_any_200.status_code}"
  depends_on  = ["aws_api_gateway_integration.proxy_any"]
}

## DEPLOYMENT
resource "aws_api_gateway_deployment" "main" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  stage_name  = "${var.environment}"

  depends_on = [
    "aws_api_gateway_method.proxy_any",
    "aws_api_gateway_integration.proxy_any",
    "aws_api_gateway_method_response.proxy_any_200",
    "aws_api_gateway_integration_response.proxy_any_200",
  ]
}

## DOMAIN NAME
resource "aws_api_gateway_domain_name" "main" {
  count = "${var.public_domain_name != "" ? 1 : 0 }"

  domain_name = "${var.api_gateway_dns_alias != "" ?
    "${var.api_gateway_dns_alias}.${var.public_domain_name}" : "${var.component}-${var.environment}.${var.public_domain_name}"}"

  certificate_arn = "${data.aws_acm_certificate.main.arn}"
}

resource "aws_api_gateway_base_path_mapping" "atf_account_view" {
  count       = "${var.public_domain_name != "" ? 1 : 0 }"
  api_id      = "${aws_api_gateway_rest_api.main.id}"
  stage_name  = "${aws_api_gateway_deployment.main.stage_name}"
  domain_name = "${aws_api_gateway_domain_name.main.domain_name}"
}
