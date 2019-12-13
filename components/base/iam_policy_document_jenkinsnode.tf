# TODO: adjust permissions based on real usage
# Give the Jenkinsnode God like privs
data "aws_iam_policy_document" "jenkinsnode" {
  statement {
    sid    = "AllowAccountManagement"
    effect = "Allow"

    actions = [
      "*",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "jenkinsnode" {
  name        = "${local.csi}-jenkinsnode"
  description = "IAM policy for ${local.csi}-jenkinsnode"
  policy      = data.aws_iam_policy_document.jenkinsnode.json
}

# TODO: peacheym: Use role_policy_attachment
resource "aws_iam_policy_attachment" "jenkinsnode" {
  name = "${local.csi}-jenkinsnode"

  roles = [
    module.jenkinsnode.iam_role_name,
  ]

  policy_arn = aws_iam_policy.jenkinsnode.arn
}

