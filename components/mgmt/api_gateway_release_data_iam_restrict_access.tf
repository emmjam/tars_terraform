/*
data "aws_iam_policy_document" "release_data_api_resource_policy" {
  statement {
    sid       = "AllowlistAccessOnly"
    actions   = ["execute-api:Invoke"]
    resources = ["${aws_api_gateway_rest_api.release_data.execution_arn}/*"]
    effect    = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values   = var.whitelist
    }
  }
}


resource "aws_api_gateway_rest_api_policy" "release_data" {
  rest_api_id = aws_api_gateway_rest_api.release_data.id
  policy      = data.aws_iam_policy_document.release_data_api_resource_policy.json
}
*/
