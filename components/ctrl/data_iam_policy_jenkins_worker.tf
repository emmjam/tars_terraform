data "aws_iam_policy_document" "jenkins_worker_iam" {
  statement {
    sid    = ""
    effect = "Allow"

    actions = [
      "iam:*",
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
