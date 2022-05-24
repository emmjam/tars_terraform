data "aws_iam_policy_document" "obs_ssm_parameters" {
  statement {
    sid = "AllowGetObsSSMPars"
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/obs/all/*",
    ]
  }
}

resource "aws_iam_policy" "obs_ssm_parameters" {
  name        = "${local.csi}-obs-ssm_parameters"
  description = "IAM policy for ${local.csi}-ssm_parameters"
  policy      = data.aws_iam_policy_document.obs_ssm_parameters.json
}

resource "aws_iam_role_policy_attachment" "obs_parameter_store" {
  role       = module.obs.iam_role_name
  policy_arn = aws_iam_policy.obs_ssm_parameters.arn
}
