resource "aws_s3_bucket_policy" "cloudtrail" {
  bucket = module.standard_bucket.id
  policy = data.aws_iam_policy_document.cloudtrail_bucket_policy.json
}

