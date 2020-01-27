data "aws_iam_policy_document" "s3_yum" {
  statement {
    sid    = "AllowManagedAccountsToList"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      module.yum_bucket.arn,
      module.yum-staging_bucket.arn,
    ]

    principals {
      type = "AWS"

      identifiers = formatlist("%s:%s:%s", "arn:aws:iam:", var.s3_yum_ro_principals, "root")
    }
  }

  statement {
    sid    = "AllowVPCEsToList"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      module.yum_bucket.arn,
      module.yum-staging_bucket.arn,
    ]

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:sourceVpc"

      values = local.trusted_vpc_ids
    }
  }

  statement {
    sid    = "AllowManagedAccountsToGet"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${module.yum_bucket.arn}/*",
      "${module.yum-staging_bucket.arn}/*",
    ]

    principals {
      type = "AWS"

      identifiers = formatlist("%s:%s:%s", "arn:aws:iam:", var.s3_yum_ro_principals, "root")
    }
  }

  statement {
    sid    = "AllowVPCEsToGet"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${module.yum_bucket.arn}/*",
      "${module.yum-staging_bucket.arn}/*",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:sourceVpc"

      values = local.trusted_vpc_ids
    }
  }
}

