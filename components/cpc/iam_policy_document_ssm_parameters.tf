# Policy to get  SSM Parameters
data "aws_iam_policy_document" "cpc_ssm_parameters" {
  statement {
    sid = "AllowGetSSMPars"
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.account_environment}/cpc/all/*"#,
      #"arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/live/cpc/all/*" # test line
    ]
  }
}

resource "aws_iam_policy" "cpc_ssm_parameters" {
  name        = "${local.csi}-cpc-ssm_parameters"
  description = "IAM policy for ${local.csi}-cpc-ssm_parameters"
  policy      = data.aws_iam_policy_document.cpc_ssm_parameters.json
}
