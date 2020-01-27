data "aws_iam_policy_document" "s3_yum_read_write" {
  statement {
    sid    = "AllowReadWriteDeleteObjects"
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
    ]

    resources = [
      "${module.yum_bucket.arn}/*",
      "${module.yum-staging_bucket.arn}/*",
    ]
  }

  statement {
    sid    = "AllowListBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      module.yum_bucket.arn,
      module.yum-staging_bucket.arn,
    ]
  }
}

