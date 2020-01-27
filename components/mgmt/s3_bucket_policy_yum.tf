resource "aws_s3_bucket_policy" "yum" {
  bucket = module.yum_bucket.id
  policy = data.aws_iam_policy_document.s3_yum.json
}

resource "aws_s3_bucket_policy" "yum-staging" {
  bucket = module.yum-staging_bucket.id
  policy = data.aws_iam_policy_document.s3_yum-staging.json
}


