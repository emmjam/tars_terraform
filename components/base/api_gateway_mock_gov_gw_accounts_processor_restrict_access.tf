data "aws_iam_policy_document" "mock_gov_gw_accounts_processor_resource_policy" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  statement {
    sid       = "AllowlistAccessOnly"
    actions   = ["execute-api:Invoke"]
    resources = ["${aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[0].execution_arn}/*"]
    effect    = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_api_gateway_rest_api_policy" "mock_gov_gw_accounts_processor" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  rest_api_id = aws_api_gateway_rest_api.mock_gov_gw_accounts_processor[count.index].id
  policy      = data.aws_iam_policy_document.mock_gov_gw_accounts_processor_resource_policy[count.index].json
}
