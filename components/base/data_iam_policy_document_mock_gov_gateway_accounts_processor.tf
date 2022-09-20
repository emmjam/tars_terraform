data "aws_iam_policy_document" "lambda_mock_gov_gw_accounts_processor" {
  count    = var.mock_gov_gw_accounts_processor == true ? 1 : 0
  
  statement {
    sid    = "AllowTarsDBParameters"
    effect = "Allow"

    actions = [
      "ssm:GetParameter",
    ]

    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tarsdb/app-user/username",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tarsdb/app-user/password",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tarsdb/app-user/connection-string"
    ]
  }
}
