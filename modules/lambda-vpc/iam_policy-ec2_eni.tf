data "aws_iam_policy_document" "ec2_eni" {
  statement {
    sid    = "AllowEC2ENIManagement"
    effect = "Allow"

    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2_eni" {
  name        = "${local.csi_name}-ec2-eni"
  description = "EC2-ENI policy for ${upper(var.name)} Lambda"
  policy      = data.aws_iam_policy_document.ec2_eni.json
}

resource "aws_iam_policy_attachment" "ec2_eni" {
  name       = "${local.csi_name}-ec2-eni"
  roles      = [aws_iam_role.main.name]
  policy_arn = aws_iam_policy.ec2_eni.arn
}
