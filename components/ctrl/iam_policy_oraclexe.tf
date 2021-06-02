resource "aws_iam_policy" "oraclexe" {
  name        = "${local.csi}-oraclexe"
  description = "IAM policy for ${local.csi}-oraclexe"
  policy      = data.aws_iam_policy_document.oraclexe.json
}

