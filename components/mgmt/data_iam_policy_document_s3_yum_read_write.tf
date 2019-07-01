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
      "${aws_s3_bucket.yum.arn}/*",
    ]
  }

  statement {
    sid    = "AllowListBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "${aws_s3_bucket.yum.arn}",
    ]
  }
}
