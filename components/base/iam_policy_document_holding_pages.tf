data "aws_iam_policy_document" "holding_pages" {
  statement {
    sid    = "AllowCloudFrontToS3Objects"
    effect = "Allow"

    actions   = [
      "s3:GetObject",
    ]
    
    resources = [
      "${aws_s3_bucket.holding_pages.arn}/*",
    ]

    principals {
      type        = "AWS"
      identifiers = [
        "${aws_cloudfront_origin_access_identity.holding_pages.iam_arn}"
      ]
    }
  }

  statement {
    sid    = "AllowCloudFrontToS3Bucket"
    effect = "Allow"

    actions   = [
      "s3:ListBucket"
    ]

    resources = [
      "${aws_s3_bucket.holding_pages.arn}"
    ]

    principals {
      type        = "AWS"
      identifiers = [
        "${aws_cloudfront_origin_access_identity.holding_pages.iam_arn}"
      ]
    }
  }
}