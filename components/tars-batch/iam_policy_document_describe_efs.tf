data "aws_iam_policy_document" "tars_batch_describe_efs" {
  statement {
    sid    = "DescribeEFS"
    effect = "Allow"

    actions = [
      "elasticfilesystem:DescribeFileSystems",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "tars_batch_describe_efs" {
  name        = "${local.csi}-tars_batch_describe_efs"
  description = "IAM policy for ${local.csi}-tars_batch_describe_efs"
  policy      = data.aws_iam_policy_document.tars_batch_describe_efs.json
}