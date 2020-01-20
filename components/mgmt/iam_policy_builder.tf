resource "aws_iam_policy" "builder" {
  name        = "${local.csi}-builder"
  description = "IAM policy for ${local.csi}-builder"
  policy      = data.aws_iam_policy_document.builder.json
}

