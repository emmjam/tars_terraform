# TODO: this is just a temporary policy
data "aws_iam_policy_document" "capita_users" {
  statement {
    sid    = "AllowCapita"
    effect = "Allow"

    actions = [
      "cloudwatch:*",
      "events:*",
      "logs:*",
      "ec2:DescribeInstanceAttribute",
      "ec2:DescribeInstanceStatus",
      "ec2:DescribeInstances",
      "ec2:DescribeNetworkAcls",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeImages",
      "ec2:DescribeTags",
      "ec2:DescribeSnapshots",
      "elasticloadbalancing:Describe*",
    ]

    resources = [
      "*",
    ]
  }

}
