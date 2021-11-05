resource "aws_api_gateway_resource" "notify" {
  rest_api_id = "${aws_api_gateway_rest_api.private_gateway.id}"
  parent_id   = "${aws_api_gateway_rest_api.private_gateway.root_resource_id}"
  path_part   = "notify"
}


# GET Incident
resource "aws_api_gateway_method" "notify_post" {
  rest_api_id      = "${aws_api_gateway_rest_api.private_gateway.id}"
  resource_id      = "${aws_api_gateway_resource.notify.id}"
  http_method      = "POST"
  authorization    = "${local.authorization}"
  authorizer_id    = ""
  api_key_required = false
}

resource "aws_api_gateway_integration" "notify" {
  rest_api_id             = "${aws_api_gateway_rest_api.private_gateway.id}"
  resource_id             = "${aws_api_gateway_resource.notify.id}"
  http_method             = "${aws_api_gateway_method.notify_post.http_method}"
  type                    = "AWS_PROXY"
  uri                     = "${module.lambda_notify.invoke_arn}"
  content_handling        = "CONVERT_TO_TEXT"

  integration_http_method = "POST"
}
