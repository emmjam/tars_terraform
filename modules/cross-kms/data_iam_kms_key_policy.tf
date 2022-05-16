data "aws_iam_policy_document" "key" {
  count = var.environment == "mgmt" ? 1 : 0
  policy_id = format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    var.name,
    "cross-key",
  )

  statement {
    sid    = "EnableIAMUserPermissions"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          645711882182,
          "root",
        ),
         "arn:aws:iam::652856684323:role/tars-nonprod-ctrl-jenkinsctrl-20180403122511377400000002",
         "arn:aws:iam::246976497890:role/tars-live-ctrl-jenkinsctrl-20181025153328009900000001",
      ]
    }

    actions = [
      "kms:*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowUseOfTheKmskey"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          246976497890,
          "root",
        ),
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          645711882182,
          "root",
        ),
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          652856684323,
          "root",
        ),
      ]
    }

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid    = "AllowKeyAdmin"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          645711882182,
          "root",
        ),
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          246976497890,
          "root",
        ),
        format(
          "%s:%s:%s",
          "arn:aws:iam:",
          652856684323,
          "root",
        ),
      ]
    }

    actions = [
      "kms:CreateGrant",
      "kms:ListGrant",
      "kms:RevokeGrant",
    ]

    resources = [
      "*",
    ]
    
    condition {
      test = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values = ["true"]
    }
  }

}
