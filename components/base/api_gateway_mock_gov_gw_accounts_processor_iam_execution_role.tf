resource "aws_iam_role" "mock_gov_gw_accounts_processor_api_execution_role" {
  count = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  name  = "${local.csi}-mock-gov-gw-accounts-processor-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowApiGateway"
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "apigateway.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "mock_gov_gw_accounts_processor_api_execution_policy" {
  count = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  name  = "${local.csi}-mock-gov-gw-accounts-processor-execution-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "lambda:InvokeFunction"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:lambda:${var.aws_region}:${var.aws_account_id}:function:${var.project}-${var.environment}-${var.component}-mock-gov-gw-accounts-processor"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "mock_gov_gw_accounts_processor_execution" {
  count      = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  role       = aws_iam_role.mock_gov_gw_accounts_processor_api_execution_role[count.index].name
  policy_arn = aws_iam_policy.mock_gov_gw_accounts_processor_api_execution_policy[count.index].arn
}
