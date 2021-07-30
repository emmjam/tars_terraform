# TODO: adjust permissions based on real usage
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

  statement {
    sid    = ""
    effect = "Allow"

    actions = [
      "route53:AssociateVPCWithHostedZone",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "DenyCreateUser"

    effect = "Deny"

    actions = [
      "iam:CreateUser"
    ]

    resources = [
      "*"
    ]
  }

}

