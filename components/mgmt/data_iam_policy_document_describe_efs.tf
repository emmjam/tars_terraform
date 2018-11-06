data "aws_iam_policy_document" "describe_efs" {
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
