# Policy to get  SSM Parameters
data "aws_iam_policy_document" "ssm_parameters" {
  statement {
    sid = "AllowGetSSMPars"
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tars-${var.environment}-epdq-*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tars-${var.environment}-GetTheory*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tars-${var.environment}-TransferTheory*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tars-${var.environment}-DocumentGeneration*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tars-${var.environment}-ProcessUnknownCardAuthorisationsJob*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tars/all/*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tars/batch/*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tars/back/*",
    ]
  }
}

resource "aws_iam_policy" "ssm_parameters" {
  name        = "${local.csi}-ssm_parameters"
  description = "IAM policy for ${local.csi}-ssm_parameters"
  policy      = data.aws_iam_policy_document.ssm_parameters.json
}
