data "aws_iam_policy_document" "legacy-tape-archive-access" {
  statement {
    sid = "AllowGetObjectS3TapeArchive"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.legacy-tape-archive.arn}",
      "${aws_s3_bucket.legacy-tape-archive.arn}/*",
    ]
  }
}

data "aws_iam_policy_document" "legacy-tape-archive-upload" {
  statement {
    sid = "AllowAllAccessS3TapeArchive"
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.legacy-tape-archive.arn}",
      "${aws_s3_bucket.legacy-tape-archive.arn}/*",
    ]
  }
}
