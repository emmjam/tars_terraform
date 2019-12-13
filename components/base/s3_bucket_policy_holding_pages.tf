resource "aws_s3_bucket_policy" "holding_pages" {
  bucket = aws_s3_bucket.holding_pages.id
  policy = data.aws_iam_policy_document.holding_pages.json
}

