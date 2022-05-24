resource "aws_iam_policy" "oraclexe" {
  count       = var.account_environment != "mgmt" ? 1 : 0
  name        = "${local.csi}-oraclexe"
  description = "IAM policy for ${local.csi}-oraclexe"
  policy      = data.aws_iam_policy_document.oraclexe.json
}

