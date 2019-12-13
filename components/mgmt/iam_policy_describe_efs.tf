resource "aws_iam_policy" "describe_efs" {
  name_prefix = "${local.csi}-describe-efs"
  path        = "/"
  policy      = data.aws_iam_policy_document.describe_efs.json
}

