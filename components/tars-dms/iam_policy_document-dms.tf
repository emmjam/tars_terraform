data "aws_iam_policy_document" "enable_dms" {
  statement {
    sid    = "AllowDMS"
    effect = "Allow"

    actions = [
      "dms:*"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowIAM"
    effect = "Allow"

    actions = [
      "iam:GetRole",
      "iam:PassRole",
      "iam:CreateRole",
      "iam:AttachRolePolicy"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowEC2"
    effect = "Allow"

    actions = [
      "ec2:DescribeVpcs",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:ModifyNetworkInterfaceAttribute",
      "ec2:CreateNetworkInterface",
      "ec2:DeleteNetworkInterface"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowCloudwatch"
    effect = "Allow"

    actions = [
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "cloudwatch:PutDashboard"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowLogs"
    effect = "Allow"

    actions = [
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:GetLogEvents"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowLogs"
    effect = "Allow"

    actions = [
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:GetLogEvents"
    ]

    resources = [
      "*",
    ]
  }

}
