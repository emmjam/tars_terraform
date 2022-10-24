data "aws_iam_policy_document" "sftpplus_describe_efs" {
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

resource "aws_iam_policy" "sftpplus_describe_efs" {
  name        = "${local.csi}-sftpplus_describe_efs"
  description = "IAM policy for ${local.csi}-sftpplus_describe_efs"
  policy      = data.aws_iam_policy_document.sftpplus_describe_efs.json
}

resource "aws_iam_role_policy_attachment" "sftpplus_describe_efs" {
  role       = module.sftpplus_svr.iam_role_name
  policy_arn = aws_iam_policy.sftpplus_describe_efs.arn
}