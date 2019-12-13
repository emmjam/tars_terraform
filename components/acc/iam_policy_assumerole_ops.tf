# A policy given to user or groups (should only be groups)
# to allow them to assume the ops role

resource "aws_iam_policy" "assumerole_ops" {
  name = "${local.csi}-assumerole-ops"

  path   = "/"
  policy = data.aws_iam_policy_document.assumerole_ops.json
}

data "aws_iam_policy_document" "assumerole_ops" {
  statement {
    sid    = "AllowAssumeRoleOps"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      aws_iam_role.ops.arn,
    ]
  }
}

