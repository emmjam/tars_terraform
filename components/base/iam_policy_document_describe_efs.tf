data "aws_iam_policy_document" "prometheus_describe_efs" {
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

resource "aws_iam_policy" "prometheus_describe_efs" {
  name        = "${local.csi}-prometheus_describe_efs"
  description = "IAM policy for ${local.csi}-prometheus_describe_efs"
  policy      = data.aws_iam_policy_document.prometheus_describe_efs.json
}