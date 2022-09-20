resource "aws_iam_policy" "lambda_mock_gov_gw_accounts_processor" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0
  
  name        = "${local.csi}-mock-gov-gw-accounts-processor"
  description = "IAM policy for ${local.csi}-mock-gov-gw-accounts-processor"
  policy      = data.aws_iam_policy_document.lambda_mock_gov_gw_accounts_processor[count.index].json
}


