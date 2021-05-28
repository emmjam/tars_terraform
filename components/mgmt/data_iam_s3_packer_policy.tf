data "aws_iam_policy_document" "s3-packer" {
  # TODO: peacheym: Why the hyphen suffix?
  policy_id = "${local.csi}-s3-packer-"

  statement {
    sid    = "AllowS3"
    effect = "Allow"

    actions = [
      "s3:HeadBucket",
      "s3:ListAllMyBuckets",
      "s3:ListObjects",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowS3Access"
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      aws_s3_bucket.artefacts.arn,
      "${aws_s3_bucket.artefacts.arn}/*",

    ]
  }

}

