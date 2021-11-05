data "aws_iam_policy_document" "api_private_resource_policy" {
  statement {
    sid    = "DenyAllButWhitelistedVPCs"
    effect = "Deny"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "execute-api:Invoke",
    ]

    resources = [
      "arn:aws:execute-api:eu-west-1:${data.aws_caller_identity.current.account_id}:*/*/*/*",
    ]

    condition {
      test     = "StringNotEquals"
      variable = "aws:sourceVpc"

      values = [
        aws_vpc.vpc.id
      ]
    }
  }

  statement {
    sid    = "AllowInvoke"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "execute-api:Invoke",
    ]

    resources = [
      "arn:aws:execute-api:eu-west-1:${data.aws_caller_identity.current.account_id}:*/*/*/*",
    ]
  }
}
