data "aws_iam_policy_document" "network_squidnat" {
  statement {
    sid    = "AttachNetInt"
    effect = "Allow"

    actions = [
      "ec2:AttachNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "network_squidnat" {
  name        = "${var.project}-${var.environment}-${var.component}-squidnat"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-squidnat"
  policy      = data.aws_iam_policy_document.network_squidnat.json
}

resource "aws_iam_policy_attachment" "network_squidnat" {
  name = "${var.project}-${var.environment}-${var.component}-squidnat_1"
  roles = [
    module.microservice_squidnat_0.iam_role_name,
    module.microservice_squidnat_1.iam_role_name,
    module.microservice_squidnat_2.iam_role_name,
  ]
  policy_arn = aws_iam_policy.network_squidnat.arn
}

