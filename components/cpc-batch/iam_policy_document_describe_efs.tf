data "aws_iam_policy_document" "cpc_batch_describe_efs" {
  statement {
    sid    = "DescribeEFS"
    effect = "Allow"

    actions = [
      "elasticfilesystem:DescribeMountTargets",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "cpc_batch_describe_efs" {
  name        = "${local.csi}-cpc_batch_describe_efs"
  description = "IAM policy for ${local.csi}-cpc_batch_describe_efs"
  policy      = data.aws_iam_policy_document.cpc_batch_describe_efs.json
}