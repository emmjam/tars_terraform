data "aws_iam_policy_document" "dbreports_output" {
  statement {
    sid    = "AllowDBtoS3Object"
    effect = "Allow"

    actions   = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    
    resources = [
      "${aws_s3_bucket.dbreports_output.arn}/*",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }

  }

  statement {
    sid    = "AllowDBToS3Bucket"
    effect = "Allow"

    actions   = [
      "s3:ListBucket"
    ]

    resources = [
      "${aws_s3_bucket.dbreports_output.arn}"
    ]

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }
  }
}
