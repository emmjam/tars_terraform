# Policy to get  SSM Parameters
data "aws_iam_policy_document" "cpc_batch_ssm_parameters" {
  statement {
    sid = "AllowGetSSMPars"
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.account_environment}/cpc/all/*"
    ]
  }
}

resource "aws_iam_policy" "cpc_batch_ssm_parameters" {
  name        = "${local.csi}-cpc-batch-ssm_parameters"
  description = "IAM policy for ${local.csi}-cpc_batch_ssm_parameters"
  policy      = data.aws_iam_policy_document.cpc_batch_ssm_parameters.json
}
